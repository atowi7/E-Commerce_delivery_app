import 'package:ecommerce_delivery_app/controller/auth/signupverfication_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SignupVerficationScreen extends StatelessWidget {
  const SignupVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupVerficationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('15'.tr),
      ),
      body: GetBuilder<SignupVerficationController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              // const Logo(),
              const Icon(
                Icons.person_2_rounded,
                size: 200,
                color: AppColor.primaryColor,
              ),
              CustomTextTitle(title: '16'.tr),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextBody(title: '${'17'.tr} in ${controller.email}'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                onSubmit: (value) {
                  controller.opensuccess(value);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  controller.resend();
                },
                child: Center(
                    child: Text('18'.tr,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: AppColor.primaryColor,
                            ))),
              )
            ],
          ),
        );
      }),
    );
  }
}
