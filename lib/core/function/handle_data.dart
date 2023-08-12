import 'package:ecommerce_delivery_app/core/class/status_request.dart';

handleData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
