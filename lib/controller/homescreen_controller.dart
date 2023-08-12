import 'package:ecommerce_delivery_app/view/screen/orders/ordersaccepted.dart';
import 'package:ecommerce_delivery_app/view/screen/orders/orderspending.dart';
import 'package:ecommerce_delivery_app/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseHomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenController extends BaseHomeScreenController {
  int currentPage = 0;
  List icons = [
    {
      'title': '109'.tr,
      'icon': Icons.lock_clock_outlined,
    },
    {
      'title': '110'.tr,
      'icon': Icons.done,
    },
    {
      'title': '117'.tr,
      'icon': Icons.settings,
    },
  ];
  List<Widget> pages = [
    const OrdersPendingScreen(),
    const OrdersAcceptedScreen(),
    const SettingScreen(),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
