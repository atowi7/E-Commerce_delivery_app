import 'package:get/get.dart';

inputValidation(type, String val, min, max) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'Invalid username';
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'Invalid email';
    }
  }

  if (val.isEmpty) {
    return 'Empty field is not allowed';
  }

  if (val.length < min) {
    return 'Use more than $min characters';
  }

  if (val.length > max) {
    return 'Use less than $min characters';
  }
}
