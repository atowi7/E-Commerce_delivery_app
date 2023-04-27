import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class OrdersAcceptedData {
  Crud crud;

  OrdersAcceptedData(this.crud);

  getData(String deliveryId) async {
    var response = await crud.postData(AppLink.ordersAccepted, {
      'deliveryid': deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }

  doneDelivery(String orderId, String userId) async {
    var response = await crud.postData(AppLink.ordersDone, {
      'ordersid': orderId,
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
