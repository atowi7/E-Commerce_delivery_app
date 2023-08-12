import 'dart:convert';

import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getDecodePolyline(double currentLat, double currentLong, double destLat,
    double destLong) async {
  Set<Polyline> polylineSet = {};
  List<LatLng> polylineCoor = [];
  PolylinePoints polylinePoints = PolylinePoints();

  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$currentLat,$currentLong&destination=$destLat,$destLong&key=AIzaSyBaRyQ3uakv3VUB8FxMpjMYNp2F1z2K-R4";

  var response = await http.post(Uri.parse(url));

  Get.snackbar('current', '$currentLat / $currentLong');
  Get.snackbar('dest', '$destLat / $destLong');

  var responsebody = jsonDecode(response.body);

  print(responsebody);

  var points = responsebody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(points);
  if (result.isNotEmpty) {
    result.forEach((element) {
      polylineCoor.add(LatLng(element.latitude, element.longitude));
    });
  }

  Polyline polyline = Polyline(
      polylineId: const PolylineId('p1'),
      points: polylineCoor,
      color: AppColor.primaryColor,
      width: 5);

  polylineSet.add(polyline);

  return polylineSet;
}
