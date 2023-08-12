import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('19'.tr),
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColor.primaryColor,
              size: 350,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Text(
              '20'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomButton(
                title: '21'.tr,
                onPressed: () {
                  Get.offNamed(AppRoute.login);
                }),
          ],
        ),
      ),
    );
  }
}
