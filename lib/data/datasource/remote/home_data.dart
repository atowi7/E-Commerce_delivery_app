import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
