import 'package:ecommerce_delivery_app/binding/binding.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/localization/localalngchange.dart';
import 'package:ecommerce_delivery_app/core/localization/translations.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:ecommerce_delivery_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalLangChange controller = Get.put(LocalLangChange());
    return GetMaterialApp(
      title: 'ECommerceDeliveryApp',
      theme: controller.appTheme,
      locale: controller.localeLangauge,
      translations: AppTranslations(),
      initialRoute: AppRoute.language,
      initialBinding: Binding(),
      getPages: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
