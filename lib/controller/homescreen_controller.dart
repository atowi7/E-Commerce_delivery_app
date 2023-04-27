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
      'title': 'Pendinging',
      'icon': Icons.lock_clock_outlined,
    },
    {
      'title': 'Accepted',
      'icon': Icons.done,
    },
    {
      'title': 'Setting',
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
