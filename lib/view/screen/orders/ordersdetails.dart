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
        title: Text('Order Detail'),
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
                  child: Table(
                    children: [
                      const TableRow(children: [
                        Text(
                          'Product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Quantity',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Price',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                      ...List.generate(
                        controller.dataList.length,
                        (index) => TableRow(children: [
                          Text(
                            '${controller.dataList[index].proName}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.dataList[index].prosCount}',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.dataList[index].prosPrice}',
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    child: Text(
                      'Total Price ${controller.orderModel.ordersTotalprice}\$',
                      style: const TextStyle(
                        color: AppColor.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              if (controller.orderModel.ordersType == '0')
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    child: ListTile(
                      title: const Text(
                        'Shipping Address',
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          '${controller.orderModel.addressCity} ${controller.orderModel.addressStreet}'),
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
                    title: 'Tracking',
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
