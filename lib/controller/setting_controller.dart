import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseSettingController extends GetxController {
  contactUs();
  logout();
}

class SettingController extends BaseSettingController {
  List sections = [
    {
      'title': 'About us',
      'icon': Icons.details_outlined,
      'onpress': () {},
    },
    {
      'title': 'Contact us',
      'icon': Icons.contact_page_rounded,
      'onpress': () {},
    },
    {
      'title': 'Archive',
      'icon': Icons.archive_outlined,
      'onpress': () {},
    },
    {
      'title': 'Display notifications',
      'icon': Icons.notifications_paused_outlined,
      'onpress': () {},
    },
    {
      'title': 'Logout',
      'icon': Icons.logout_outlined,
      'onpress': () {},
    }
  ];
  AppServices appServices = Get.find();

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
    String userid = appServices.sharedPreferences.getString('userid')!;

    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('user$userid');

    appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
