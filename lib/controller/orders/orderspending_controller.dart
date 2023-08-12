import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/orders/orderspending_data.dart';
import 'package:ecommerce_delivery_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

abstract class BaseOrdersPendingController extends GetxController {
  viewOrders();
  approveOrders(String orderid, String userid);
  refreshPage();
  String getDeliveryType(String val);
  String getPaymentMethod(String val);
  String getStatus(String val);
  goToOrderDetails();
}

class OrdersPendingController extends BaseOrdersPendingController {
  List<OrderModel> dataList = [];
  AppServices appServices = Get.find();

  OrdersPendingData ordersdata = OrdersPendingData(Get.find());

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
    var response = await ordersdata.getData();

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
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
  approveOrders(String orderid, String userid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata.approveOrders(
      orderid,
      userid,
      appServices.sharedPreferences.getString('deliveryid')!,
      appServices.sharedPreferences.getString('deliveryname')!,
    );

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('30'.tr, '116'.tr);
        // Get.put(TrackingController());
        refreshPage();
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
      return '99'.tr;
    } else {
      return '100'.tr;
    }
  }

  @override
  String getPaymentMethod(String val) {
    if (val == '0') {
      return '101'.tr;
    } else {
      return '102'.tr;
    }
  }

  @override
  String getStatus(String val) {
    if (val == '0') {
      return '103'.tr;
    } else if (val == '1') {
      return '104'.tr;
    } else if (val == '2') {
      return '105'.tr;
    } else if (val == '3') {
      return '106'.tr;
    } else {
      return '107'.tr;
    }
  }

  @override
  refreshPage() {
    dataList.clear();
    viewOrders();
  }

  @override
  goToOrderDetails() {
    // Get.toNamed(AppRoute.ordersDetails, arguments: {
    //   'orderModel': dataList,
    // });
  }
}
