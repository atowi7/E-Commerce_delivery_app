import 'package:ecommerce_delivery_app/controller/orders/orderdetials_controller.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/view/widget/auth/custombutton.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetialsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('39'.tr),
      ),
      body: GetBuilder<OrderDetialsController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Card(
                  color: AppColor.forthColor,
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text(
                          '40'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          '41'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          '42'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ]),
                      ...List.generate(
                        controller.dataList.length,
                        (index) => TableRow(children: [
                          Text(
                            '${controller.dataList[index].proName}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            '${controller.dataList[index].prosCount}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            '${controller.dataList[index].prosPrice}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    color: AppColor.forthColor,
                    child: Text(
                      '${'43'.tr} ${controller.orderModel.ordersTotalprice}\$',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                ),
              ),
              if (controller.orderModel.ordersType == '0')
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    color: AppColor.forthColor,
                    child: Column(
                      children: [
                        Text(
                          '44'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        ListTile(
                          title: Text(
                            '${controller.orderModel.addressName}',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          subtitle: Text(
                            '${controller.orderModel.addressCity} ${controller.orderModel.addressStreet}',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (controller.orderModel.ordersType == '0')
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Card(
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: controller.kGooglePlex!,
                      onMapCreated: (GoogleMapController mapcontroller) {
                        controller.mapcontroller.complete(mapcontroller);
                      },
                      markers: controller.markers,
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              if (controller.orderModel.ordersType == '0' &&
                  controller.orderModel.ordersStatus == '3')
                CustomButton(
                    title: '54'.tr,
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersTracking, arguments: {
                        'orderModel': controller.orderModel,
                      });
                    }),
            ],
          ),
        );
      }),
    );
  }
}
