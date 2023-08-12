import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

abstract class BaseSettingController extends GetxController {
  displayNotification(bool val);
  contactUs();
  logout();
}

class SettingController extends BaseSettingController {
  late String deliveryId;
  late String deliveryName;
  late String deliveryImage;

  bool value = false;
  // List sections = [
  //   {
  //     'title': '118'.tr,
  //     'icon': Icons.details_outlined,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': ' 119'.tr,
  //     'icon': Icons.contact_page_rounded,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': '107'.tr,
  //     'icon': Icons.archive_outlined,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': '120'.tr,
  //     'icon': Icons.notifications_paused_outlined,
  //     'onpress': () {},
  //   },
  //   {
  //     'title': '121'.tr,
  //     'icon': Icons.logout_outlined,
  //     'onpress': () {},
  //   }
  // ];
  AppServices appServices = Get.find();

  @override
  void onInit() {
    deliveryId = appServices.sharedPreferences.getString('deliveryid')!;
    deliveryName = appServices.sharedPreferences.getString('deliveryname')!;
    deliveryImage = 'default';
    super.onInit();
  }

  @override
  displayNotification(val) {
    value = val;

    if (value == true) {
      //  FirebaseMessaging.instance.subscribeToTopic('delivery$deliveryId');
    } else {
      // FirebaseMessaging.instance.unsubscribeFromTopic('delivery$deliveryId');
    }

    update();
  }

  @override
  contactUs() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'dhoom.sedge@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'E-commerce App',
        'body': 'Contact Us',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  @override
  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic('deliverys');
    FirebaseMessaging.instance.unsubscribeFromTopic('delivery$deliveryId');

    appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
