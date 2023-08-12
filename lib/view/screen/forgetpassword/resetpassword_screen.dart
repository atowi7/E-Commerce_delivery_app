import 'package:ecommerce_delivery_app/controller/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/core/function/input_validation.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: Text('26'.tr),
      ),
      body: GetBuilder<ResetPasswordController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                // const Logo(),
                const Icon(
                  Icons.lock_reset_outlined,
                  size: 50,
                  color: AppColor.primaryColor,
                ),
                CustomTextTitle(title: '27'.tr),
                // const CustomTextBody(
                //     title:
                //         'Sign in with your email and password or continue with socail media'),
                CustomTextForm(
                  labelText: '9'.tr,
                  hintText: '9'.tr,
                  isNumber: false,
                  obscureText: controller.isPassHidden,
                  icon: Icons.lock,
                  controller: controller.password,
                  validator: (val) {
                    return inputValidation('password', val!, 8, 20);
                  },
                  onTapIcon: controller.showPassword(),
                ),
                CustomTextForm(
                  labelText: '28'.tr,
                  hintText: '28'.tr,
                  icon: Icons.lock,
                  isNumber: false,
                  obscureText: controller.isPassHidden,
                  controller: controller.repassword,
                  validator: (val) {
                    return inputValidation('password', val!, 8, 20);
                  },
                  onTapIcon: controller.showPassword(),
                ),

                CustomButton(
                  title: '29'.tr,
                  onPressed: () {
                    controller.opensuccess();
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
