import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

exitAppAlert() {
  return Get.defaultDialog(
      title: 'Warning',
      middleText: 'are you sure?',
      actions: [
        ElevatedButton(onPressed: () => exit(0), child: const Text('Yes')),
        ElevatedButton(onPressed: () => Get.back(), child: const Text('No')),
      ]);
}
