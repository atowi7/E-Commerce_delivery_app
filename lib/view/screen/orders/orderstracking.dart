import 'package:ecommerce_delivery_app/controller/tracking_controller.dart';
import 'package:ecommerce_delivery_app/core/class/handlingdataview.dart';
import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: GetBuilder<TrackingController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: controller.kGooglePlex!,
                  polylines: controller.polylineSet,
                  onMapCreated: (GoogleMapController mapcontroller) {
                    controller.mapcontroller = mapcontroller;
                  },
                  markers: controller.markers,
                ),
              ),
              MaterialButton(
                color: AppColor.blue,
                minWidth: 200,
                onPressed: () {
                  controller.doneDelivery();
                },
                child: Text('Done'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
