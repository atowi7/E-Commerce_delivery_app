import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:ecommerce_delivery_app/core/constant/applink.dart';

class SignupVerificationData {
  Crud curd;
  SignupVerificationData(this.curd);

  postData(String email, String verifyCode) async {
    var response = await curd.postData(AppLink.sifnupVerifyCode, {
      'email': email,
      'verifycode': verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }

  resend(String email) async {
    var response = await curd.postData(AppLink.resendVerifyCode, {
      'email': email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
