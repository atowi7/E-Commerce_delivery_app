import 'dart:io';

import 'package:ecommerce_delivery_app/controller/homescreen_controller.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: GetBuilder<HomeScreenController>(builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            await Get.defaultDialog(
              title: 'Warrning',
              titleStyle: Theme.of(context).textTheme.displayMedium,
              middleText: 'Are you sure',
              middleTextStyle: Theme.of(context).textTheme.displaySmall,
              onConfirm: () => exit(0),
              confirmTextColor: AppColor.blue,
              cancelTextColor: AppColor.blue,
              buttonColor: AppColor.white,
              onCancel: () {},
            );
            return false;
          },
          child: Container(
            child: controller.pages.elementAt(controller.currentPage),
          ),
        );
      }),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
