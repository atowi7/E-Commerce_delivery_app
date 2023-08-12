import 'package:ecommerce_delivery_app/controller/forgetpassword/verifycode_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('15'.tr),
      ),
      body: GetBuilder<VerifycodeController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              // const Logo(),
              const Icon(
                Icons.email_outlined,
                size: 50,
                color: AppColor.primaryColor,
              ),
              CustomTextTitle(title: '16'.tr),
              CustomTextBody(title: '${'17'.tr} ${controller.email}'),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                onSubmit: (value) {
                  controller.openResetPassword(value);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
