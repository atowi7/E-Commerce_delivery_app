import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_delivery_app/controller/orders/ordersaccepted_controller.dart';
import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/constant/route.dart';
import 'package:ecommerce_delivery_app/core/function/getdecodepolyline.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:ecommerce_delivery_app/data/model/ordermodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BaseTrackingController extends GetxController {
  getCurrentPosition();
  getDestPosition();
  getPolyline();
  sendLocationToUser();
  doneDelivery();
}

class TrackingController extends BaseTrackingController {
  late StatusRequest statusRequest;

  late OrderModel orderModel;

  AppServices appServices = Get.find();

  OrdersAcceptedController ordersAcceptedController = Get.find();

  bool? serviceEnabled;
  LocationPermission? permission;

  GoogleMapController? mapcontroller;

  CameraPosition? kGooglePlex;

  Set<Marker> markers = {};

  Set<Polyline> polylineSet = {};

  StreamSubscription<Position>? positionStream;

  Timer? timer;

  double? currentLat;
  double? currentLong;
  double? destLat;
  double? destLong;

  @override
  void onInit() {
    statusRequest = StatusRequest.sucess;
    orderModel = Get.arguments['orderModel'];

    getCurrentPosition();
    getDestPosition();
    getPolyline();
    sendLocationToUser();
    super.onInit();
  }

  @override
  getCurrentPosition() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      Get.snackbar('NOTFY', 'Please enable the location');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('NOTFY', 'Please enable the location to use the map');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('NOTFY', 'You can not use the map without your location');
    }
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      currentLat = 51.7519;
      currentLong = -1.2578;

      if (mapcontroller != null) {
        mapcontroller!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)));
      }

      markers.removeWhere((element) => element.markerId.value == 'current');
      markers.add(Marker(
          markerId: const MarkerId('current'),
          position: LatLng(currentLat!, currentLong!)));

      update();
    });
  }

  @override
  getDestPosition() {
    destLat = 50.8429;
    destLong = -0.1313;

    kGooglePlex = CameraPosition(
      target: LatLng(destLat!, destLong!),
      zoom: 15,
    );
    markers.add(Marker(
        markerId: const MarkerId('destination'),
        position: LatLng(destLat!, destLong!)));
  }

  @override
  getPolyline() async {
    await Future.delayed(const Duration(seconds: 1));
    polylineSet =
        await getDecodePolyline(currentLat!, currentLong!, destLat!, destLong!);
  }

  @override
  sendLocationToUser() async {
    await Future.delayed(Duration(seconds: 2));

    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance
          .collection('delivery')
          .doc(orderModel.ordersId)
          .set({
        'lat': currentLat,
        'long': currentLong,
        'deliveryid': appServices.sharedPreferences.getString('deliveryid'),
      });
    });
  }

  @override
  void onClose() {
    mapcontroller!.dispose();
    positionStream!.cancel();
    timer!.cancel();
    super.onClose();
  }

  @override
  doneDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await ordersAcceptedController.doneDelivery(
        orderModel.ordersId!, orderModel.ordersUserid!);

    Get.offAllNamed(AppRoute.homePage);
  }
}
