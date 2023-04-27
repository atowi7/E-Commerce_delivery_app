import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {
  final String t1;
  final String t2;
  final void Function()? onTap;
  const CustomTextAuth({
    super.key,
    required this.t1,
    required this.t2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(t1),
        InkWell(
          onTap: onTap,
          child: Text(t2),
        )
      ],
    );
  }
}
