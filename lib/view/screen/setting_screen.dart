import 'package:ecommerce_delivery_app/controller/setting_controller.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              border: Border.all(color: AppColor.primaryColor, width: 2.5),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: settingController.deliveryImage == 'default'
                    ? const Icon(
                        Icons.person_2_outlined,
                        size: 100,
                      )
                    : Image.network(
                        settingController.deliveryImage,
                        height: 100,
                        width: 100,
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                settingController.deliveryName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
        GetBuilder<SettingController>(
          builder: (controller) {
            return ListTile(
              title: Text(
                '120'.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              trailing: Switch(
                  value: controller.value,
                  activeColor: AppColor.primaryColor,
                  onChanged: (value) {
                    controller.displayNotification(value);
                  }),
            );
          }
        ),
        ListTile(
          onTap: () {
            Get.toNamed(AppRoute.ordersArchive);
          },
          title: Text(
            '107'.tr,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          trailing: const Icon(Icons.archive_outlined),
        ),
        ListTile(
          onTap: () {
            settingController.contactUs();
          },
          title: Text(
            '119'.tr,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          trailing: const Icon(Icons.contact_mail_outlined),
        ),
        ListTile(
          onTap: () {
            settingController.logout();
          },
          title: Text(
            '121'.tr,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          trailing: const Icon(Icons.logout_outlined),
        )
      ],
    );
  }
}
