import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/auth/signupverification_data.dart';
import 'package:get/get.dart';

abstract class BaseSignupVerficationController extends GetxController {
  openSucess(String verifyCode);
  resend();
}

class SignupVerficationController extends BaseSignupVerficationController {
  SignupVerificationData signupVerificationData =
      SignupVerificationData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  //String verifyCode;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  openSucess(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupVerificationData.postData(email!, verifyCode);
    statusRequest = handleData(response);
    if (statusRequest == StatusRequest.sucess) {
      if (response['status'] == 'sucess') {
        Get.offNamed(AppRoute.successSignup);
      } else {
        Get.defaultDialog(title: 'ERROR', middleText: 'VCODE ERROR');
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.defaultDialog(title: 'ERROR', middleText: 'SERVER ERROR');
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  resend() async {
    var response = await signupVerificationData.resend(email!);
    statusRequest = handleData(response);
    if (statusRequest == StatusRequest.sucess) {
      if (response['status'] == 'sucess') {
        Get.defaultDialog(title: 'Warring', middleText: 'VCODE is send');
      } else {
        Get.defaultDialog(title: 'ERROR', middleText: 'VCODE is not send');
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.defaultDialog(title: 'ERROR', middleText: 'SERVER ERROR');
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
