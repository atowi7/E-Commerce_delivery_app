import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:get/get.dart';

AppServices appServices = Get.find();
langTranslateDataBase(String namear, String nameen) {
  if (appServices.sharedPreferences.getString('lang') == 'ar') {
    return namear;
  } else {
    return nameen;
  }
}
