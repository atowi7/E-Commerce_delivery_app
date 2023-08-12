import 'package:ecommerce_delivery_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/core/function/exitapp_alert.dart';
import 'package:ecommerce_delivery_app/core/function/input_validation.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextauth.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '4'.tr,
        ),
        leading: const Icon(Icons.person_2_rounded),
      ),
      body: WillPopScope(
        onWillPop: () async {
          exitAppAlert();
          return true;
        },
        child: GetBuilder<SignupController>(builder: (controller) {
          return HandlingDataReqest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    const Icon(
                      Icons.person_2_rounded,
                      size: 200,
                      color: AppColor.primaryColor,
                    ),
                    CustomTextTitle(title: '4'.tr),
                    CustomTextBody(title: '5'.tr),
                    CustomTextForm(
                      labelText: '6'.tr,
                      hintText: '6'.tr,
                      icon: Icons.person,
                      isNumber: false,
                      controller: controller.userName,
                      validator: (val) {
                        return inputValidation('username', val!, 5, 20);
                      },
                      onTapIcon: controller.showPassword(),
                    ),
                    CustomTextForm(
                      labelText: '7'.tr,
                      hintText: '7'.tr,
                      icon: Icons.email,
                      isNumber: false,
                      controller: controller.email,
                      validator: (val) {
                        return inputValidation('email', val!, 10, 50);
                      },
                    ),
                    // CustomTextForm(
                    //   labelText: '8'.tr,
                    //   hintText: '8'.tr,
                    //   icon: Icons.phone,
                    //   isNumber: true,
                    //   controller: controller.phone,
                    //   validator: (val) {
                    //     return inputValidation('phone', val!, 10, 50);
                    //   },
                    // ),
                    CustomTextForm(
                      labelText: '9'.tr,
                      hintText: '9'.tr,
                      icon: Icons.lock,
                      isNumber: false,
                      controller: controller.password,
                      obscureText: controller.isPassHidden,
                      validator: (val) {
                        return inputValidation('password', val!, 8, 20);
                      },
                    ),
                    CustomButton(
                      title: '4'.tr,
                      onPressed: () {
                        controller.openSignupVerfication();
                      },
                    ),
                    CustomTextAuth(
                      t1: '14'.tr,
                      t2: '10'.tr,
                      onTap: () {
                        controller.openLogin();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
