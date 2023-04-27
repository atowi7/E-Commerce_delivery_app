import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class FirstMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  AppServices appServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    return appServices.sharedPreferences.getString('page') == 'l'
        ? const RouteSettings(name: AppRoute.login)
        : appServices.sharedPreferences.getString('page') == 'h'
            ? const RouteSettings(name: AppRoute.homePage)
            : null;
  }
}
