import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String pass) async {
    var response =
        await crud.postData(AppLink.login, {'email': email, 'pass': pass});
    return response.fold((l) => l, (r) => r);
  }
}
