import 'package:ecommerce_delivery_app/core/constant/theme.dart';
import 'package:ecommerce_delivery_app/core/function/fcmconfig.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalLangChange extends GetxController {
  Locale? localeLangauge;
  ThemeData? appTheme;

  AppServices appServices = Get.find();

  @override
  void onInit() {
    notificationPermission();
    fcmConfig();
    String? lang = appServices.sharedPreferences.getString('lang');

    if (lang == 'ar') {
      localeLangauge = Locale(lang!);
      appTheme = arabicTheme;
    } else if (lang == 'en') {
      localeLangauge = Locale(lang!);
      appTheme = englishTheme;
    } else {
      localeLangauge = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }

  void changeLang(String lang) {
    Locale l = Locale(lang);

    appServices.sharedPreferences.setString('lang', lang);

    appTheme = lang == 'ar' ? arabicTheme : englishTheme;

    Get.updateLocale(l);

    Get.changeTheme(appTheme!);
  }
}
