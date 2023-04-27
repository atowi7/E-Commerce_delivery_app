import 'package:ecommerce_delivery_app/controller/home_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return ListView(
      children: [
        GetBuilder<HomeController>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [],
            ),
          );
        }),
      ],
    );
  }
}
