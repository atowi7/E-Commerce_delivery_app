import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.ordersPending, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String orderId, String userId, String deliveryId,
      String deliveryName) async {
    var response = await crud.postData(AppLink.ordersApproval, {
      'ordersid': orderId,
      'userid': userId,
      'deliveryid': deliveryId,
      'deliveryname': deliveryName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
