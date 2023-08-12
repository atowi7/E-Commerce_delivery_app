import 'package:ecommerce_delivery_app/controller/search_controller.dart';
import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/core/service/services.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/home_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class BaseHomeController extends SearchController {
  getData();
}

class HomeController extends BaseHomeController {
  String? id;
  String? name;

  String? cardTitle;
  String? cardDesc;

  String? deliveryTime;

  HomeData homeData = HomeData(Get.find());
  AppServices appServices = Get.find();

  List headings = [];
  List categories = [];
  List products = [];
  List topSellingProducts = [];

  @override
  void onInit() {
    id = appServices.sharedPreferences.getString('deliveryid');
    // name = appServices.sharedPreferences.getString('username');
    searchTextController = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        headings.addAll(response['headings']);
        cardTitle = headings[0]['heading_title'];
        cardDesc = headings[0]['heading_body'];

        deliveryTime = headings[0]['heading_deliverytime'];
        appServices.sharedPreferences.setString('deliverytime', deliveryTime!);

        categories.addAll(response['categories']);
        products.addAll(response['producttopselling']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
