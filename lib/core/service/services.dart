import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<AppServices> init() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future initServices() async {
  await Get.putAsync(() => AppServices().init());
}
