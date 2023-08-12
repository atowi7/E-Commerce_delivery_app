import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height*0.3,
      width: Get.size.width*0.3,
      padding:  EdgeInsets.all(Get.size.width*0.05),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: Lottie.asset(ImageAssets.profile, fit: BoxFit.contain));
  }
}
