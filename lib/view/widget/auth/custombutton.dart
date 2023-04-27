import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
        ),
        onPressed: onPressed,
        child: Text(title, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
