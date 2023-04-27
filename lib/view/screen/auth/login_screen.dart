import 'package:ecommerce_delivery_app/controller/auth/login_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/function/exitapp_alert.dart';
import 'package:ecommerce_delivery_app/core/function/input_validation.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextauth.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('19'.tr),
      ),
      body: WillPopScope(
        onWillPop: () async {
          exitAppAlert();
          return true;
        },
        child: GetBuilder<LoginController>(builder: (controller) {
          return HandlingDataReqest(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    const Logo(),
                    CustomTextTitle(title: '19'.tr),
                    CustomTextBody(title: '20'.tr),
                    CustomTextForm(
                      labelText: '16'.tr,
                      hintText: '16'.tr,
                      icon: Icons.email,
                      isNumber: false,
                      controller: controller.email,
                      validator: (val) {
                        return inputValidation('email', val!, 10, 50);
                      },
                    ),
                    GetBuilder<LoginController>(builder: (controller) {
                      return CustomTextForm(
                        labelText: '18'.tr,
                        hintText: '18'.tr,
                        icon: Icons.lock,
                        isNumber: false,
                        obscureText: controller.isPassHidden,
                        controller: controller.pass,
                        validator: (val) {
                          return inputValidation('password', val!, 10, 50);
                        },
                        onTapIcon: controller.showPassword,
                      );
                    }),
                    InkWell(
                        onTap: () {
                          controller.openForgerPassword();
                        },
                        child: Text('21'.tr, textAlign: TextAlign.end)),
                    CustomButton(
                      title: '19'.tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    CustomTextAuth(
                      t1: '22'.tr,
                      t2: '13'.tr,
                      onTap: () {
                        controller.openSignUp();
                      },
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
