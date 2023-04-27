import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/orders/ordersarchive_data.dart';
import 'package:ecommerce_delivery_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

abstract class BaseOrdersArchiveController extends GetxController {
  viewOrders();
  refreshPage();
  String getDeliveryType(String val);
  String getPaymentMethod(String val);
  String getStatus(String val);
  goToOrderDetails();
}

class OrdersArchiveController extends BaseOrdersArchiveController {
  List<OrderModel> dataList = [];
  AppServices appServices = Get.find();

  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  late StatusRequest statusRequest;
  @override
  void onInit() {
    viewOrders();
    super.onInit();
  }

  @override
  viewOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData(appServices.sharedPreferences.getString('deliveryid')!);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  String getDeliveryType(String val) {
    if (val == '0') {
      return 'delivery';
    } else {
      return 'Myself';
    }
  }

  @override
  String getPaymentMethod(String val) {
    if (val == '0') {
      return 'cash';
    } else {
      return 'card';
    }
  }

  @override
  String getStatus(String val) {
    if (val == '0') {
      return 'waitting for approval';
    } else if (val == '1') {
      return 'preparing';
    } else if (val == '2') {
      return 'On the way';
    } else if (val == '3') {
      return 'Ready to pickup by delivery service';
    } else {
      return 'Archive';
    }
  }

  @override
  refreshPage() {
    viewOrders();
  }

  @override
  goToOrderDetails() {
    // Get.toNamed(AppRoute.ordersDetails, arguments: {
    //   'orderModel': dataList,
    // });
  }
}
