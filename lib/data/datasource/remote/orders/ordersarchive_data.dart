import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String deliveryId) async {
    var response = await crud.postData(AppLink.ordersArchive, {
      'deliveryid': deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
