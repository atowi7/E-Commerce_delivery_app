import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseSignupController extends GetxController {
  openLogin();
  openSignupVerfication();
}

class SignupController extends BaseSignupController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  bool isPassHidden = true;

  SignupData signupData = SignupData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  showPassword() {
    isPassHidden == true ? false : true;
    update();
  }

  @override
  openLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  openSignupVerfication() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          userName.text, email.text, password.text, phone.text);
      statusRequest = handleData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.signupVerfication,
              arguments: {'email': email.text});
        } else {
          Get.defaultDialog(
              title: '88'.tr, middleText: '113'.tr);
          statusRequest = StatusRequest.noDatafailure;
        }
      } else {
        Get.defaultDialog(title: '88'.tr, middleText: '89'.tr);
        statusRequest = StatusRequest.serverFailure;
      }
    } else {
      // Get.defaultDialog(title: '88'.tr, middleText: '95'.tr);
    }
    update();
  }

  // @override
  // void dispose() {
  //   userName.dispose();
  //   email.dispose();
  //   password.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
