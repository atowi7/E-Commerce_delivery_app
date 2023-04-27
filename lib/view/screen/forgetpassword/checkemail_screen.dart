import 'package:ecommerce_delivery_app/controller/forgetpassword/checkemail_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/function/input_validation.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/customtexttitle.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckemailScreen extends StatelessWidget {
  const CheckemailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Check Email'),
      ),
      body: GetBuilder<CheckEmailController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const Logo(),
                const CustomTextTitle(title: 'Check Email'),
                const CustomTextBody(
                    title:
                        'Please Enter your email to recieve the verfication code'),
                CustomTextForm(
                  labelText: 'Email',
                  hintText: 'Email',
                  icon: Icons.email,
                  isNumber: false,
                  controller: controller.email,
                  validator: (val) {
                    return inputValidation('email', val!, 10, 50);
                  },
                ),
                CustomButton(
                  title: 'Check',
                  onPressed: () {
                    controller.openVerfication();
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
