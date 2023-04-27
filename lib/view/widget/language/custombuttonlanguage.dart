import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonLang(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: AppColor.blue,
          ),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
