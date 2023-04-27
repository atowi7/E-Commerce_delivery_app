import 'package:ecommerce_delivery_app/core/class/crud.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
