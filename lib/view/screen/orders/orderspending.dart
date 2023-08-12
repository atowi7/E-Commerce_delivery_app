import 'package:ecommerce_delivery_app/controller/orders/orderspending_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/view/widget/order/orderpendingwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPendingScreen extends StatelessWidget {
  const OrdersPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return GetBuilder<OrdersPendingController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: RefreshIndicator(
          onRefresh: () => controller.viewOrders(),
          child: ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, i) =>
                OrderPendingWedget(orderModel: controller.dataList[i]),
          ),
        ),
      );
    });
  }
}
