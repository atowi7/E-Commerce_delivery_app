import 'package:ecommerce_delivery_app/controller/homescreen_controller.dart';
import 'package:ecommerce_delivery_app/view/widget/home/custombotton_bottomappbar.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return BottomAppBar(
          height: 70,
          shape: const CircularNotchedRectangle(),
          notchMargin: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.pages.length, (index) {
              return CustomBottonBottomAppBar(
                title: controller.icons[index]['title'],
                icon: controller.icons[index]['icon'],
                active: controller.currentPage == index ? true : false,
                onPressed: () => controller.changePage(index),
              );
            }),
          ));
    });
  }
}
