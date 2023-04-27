import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/localization/localalngchange.dart';
import 'package:ecommerce_delivery_app/view/widget/language/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocalLangChange> {
  const LanguageScreen({super.key});
  // ch() async {
  //   var res = await checkInternet();
  //   print(res);
  // }

  @override
  Widget build(BuildContext context) {
    // ch();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1'.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          CustomButtonLang(
              text: '2'.tr,
              onPressed: () {
                controller.changeLang('ar');
                 Get.toNamed(AppRoute.login);
              }),
          CustomButtonLang(
              text: '3'.tr,
              onPressed: () {
                controller.changeLang('en');
                 Get.toNamed(AppRoute.login);
              }),
        ],
      ),
    );
  }
}
