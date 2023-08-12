import 'package:ecommerce_delivery_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottonBottomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool active;
  final void Function() onPressed;

  const CustomBottonBottomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.active,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: active ? AppColor.primaryColor : AppColor.secondaryColor,
            size: 30,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
