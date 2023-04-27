import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class SignupData {
  Crud curd;
  SignupData(this.curd);

  postData(String name, String email, String pass, String phone) async {
    var response = await curd.postData(AppLink.signup, {
      'name': name,
      'email': email,
      'pass': pass,
      'phone': phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
