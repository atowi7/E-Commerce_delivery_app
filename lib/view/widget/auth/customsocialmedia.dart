import 'package:flutter/material.dart';

class CustomSocialMedia extends StatelessWidget {
  final String image;
  final String text;
  final void Function()? onTap;
  const CustomSocialMedia(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
