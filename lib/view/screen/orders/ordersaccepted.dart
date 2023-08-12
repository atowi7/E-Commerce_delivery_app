import 'package:ecommerce_delivery_app/controller/orders/ordersaccepted_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/view/widget/order/orderacceptedwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAcceptedScreen extends StatelessWidget {
  const OrdersAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
      body: GetBuilder<OrdersAcceptedController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: RefreshIndicator(
            onRefresh: () => controller.viewOrders(),
            child: ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (context, i) =>
                  OrderAcceptedWedget(orderModel: controller.dataList[i]),
            ),
          ),
        );
      }),
    );
  }
}
