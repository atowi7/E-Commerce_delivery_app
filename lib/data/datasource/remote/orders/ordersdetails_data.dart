import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String orderId) async {
    var response = await crud.postData(AppLink.ordersDetials, {
      'orderid': orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
