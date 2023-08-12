import 'package:ecommerce_delivery_app/core/class/status_request.dart';
import 'package:ecommerce_delivery_app/core/function/handle_data.dart';
import 'package:ecommerce_delivery_app/data/datasource/remote/search_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseSearchController extends GetxController {
  onSearch();
  onChangeSearch(String val);
  getsearchData();
}

class SearchController extends BaseSearchController {
  TextEditingController? searchTextController;
  bool isSearch = false;

  SearchData searchData = SearchData(Get.find());

  late StatusRequest statusRequest;

  @override
  onSearch() {
    getsearchData();
    isSearch = true;
    update();
  }

  @override
  onChangeSearch(val) {
    if (val == '') {
      isSearch = false;
    }
    update();
  }

  @override
  getsearchData() async {
    statusRequest = StatusRequest.loading;

    var response = await searchData.searchData(searchTextController!.text);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //List data = response['data'];

        update();
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }
}
