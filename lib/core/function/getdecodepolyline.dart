import 'dart:convert';

import 'package:flutter/Material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getDecodePolyline(
    double lat, double long, double destLat, double destLong) async {

  Set<Polyline> polylineSet = {};
  List<LatLng> polylineCoor = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destLat,$destLong&key=AIzaSyCbPIA-wwzTS6SdhGKNlhiZRjAkyJHFBKY";

  var response = await http.post(Uri.parse(url));
  print('Current Location : $lat , $long');
  print('Destination Location : $destLat , $destLong');
  print('response body : ${response.body}');
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
      color: Colors.red,
      width: 5);

  polylineSet.add(polyline);

  return polylineSet;
}
