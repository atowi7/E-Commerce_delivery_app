import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/function/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String urlLink, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(urlLink), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map res = json.decode(response.body);
          return Right(res);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.unexpectedError);
    }
  }
}
