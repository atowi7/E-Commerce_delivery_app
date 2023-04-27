import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTapIcon;
  const CustomTextForm({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.isNumber,
    this.obscureText,
    required this.controller,
    required this.validator,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        obscureText: obscureText == null || false ? false : true,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            label: Text(labelText),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(icon)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
              20,
            ))),
      ),
    );
  }
}
