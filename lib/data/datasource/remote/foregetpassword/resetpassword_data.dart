import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String pass) async {
    var response =
        await crud.postData(AppLink.resetpassword, {'email': email, 'pass': pass});
    return response.fold((l) => l, (r) => r);
  }
}
