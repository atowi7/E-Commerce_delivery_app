import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifyCode, {'email': email, 'verifycode': verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
