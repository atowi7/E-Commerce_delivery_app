import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/foregetpassword/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseCheckEmailController extends GetxController {
  // check();
  openVerfication();
  backTologin();
}

class CheckEmailController extends BaseCheckEmailController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController email;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  openVerfication() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);

      statusRequest = handleData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.verfication, arguments: {'email': email.text});
        } else {
          Get.defaultDialog(title: '88'.tr, middleText: '94'.tr);
          //statusRequest = StatusRequest.noDatafailure;
        }
      } else {
        Get.defaultDialog(title: '88'.tr, middleText: '89'.tr);
        //statusRequest = StatusRequest.serverFailure;
      }
    } else {
      // Get.defaultDialog(title: '88'.tr, middleText: '95'.tr);
    }
    update();
  }

  @override
  backTologin() {
    Get.offAllNamed(AppRoute.login);
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
