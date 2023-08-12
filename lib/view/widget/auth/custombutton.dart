import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
        splashColor: AppColor.secondaryColor,
        onPressed: onPressed,
        child: Text(title, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
