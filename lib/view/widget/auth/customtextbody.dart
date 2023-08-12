import 'package:flutter/material.dart';

class CustomTextBody extends StatelessWidget {
  final String title;
  const CustomTextBody({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
