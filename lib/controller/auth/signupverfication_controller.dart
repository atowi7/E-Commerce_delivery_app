import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/auth/signupverification_data.dart';
import 'package:get/get.dart';

abstract class BaseSignupVerficationController extends GetxController {
  opensuccess(String verifyCode);
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
  opensuccess(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupVerificationData.postData(email!, verifyCode);
    statusRequest = handleData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.successSignup);
      } else {
        Get.defaultDialog(title: '88'.tr, middleText: '97'.tr);
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.defaultDialog(title: '88'.tr, middleText: '89'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  resend() async {
    var response = await signupVerificationData.resend(email!);
    statusRequest = handleData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.defaultDialog(title: '30'.tr, middleText: '114'.tr);
      } else {
        Get.defaultDialog(title: '88'.tr, middleText: '115'.tr);
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.defaultDialog(title: '88'.tr, middleText: '89'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
