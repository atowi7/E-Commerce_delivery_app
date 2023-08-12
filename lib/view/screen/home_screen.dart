import 'dart:io';

import 'package:ecommerce_delivery_app/controller/homescreen_controller.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.shopping_bag_outlined,size: 30,),
        title: Text('36'.tr),
      ),
      body: GetBuilder<HomeScreenController>(builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            await Get.defaultDialog(
              title: '30'.tr,
              titleStyle: Theme.of(context).textTheme.displayMedium,
              middleText: '31'.tr,
              middleTextStyle: Theme.of(context).textTheme.displaySmall,
              onConfirm: () => exit(0),
              confirmTextColor: AppColor.primaryColor,
              cancelTextColor: AppColor.primaryColor,
              buttonColor: AppColor.forthColor,
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
