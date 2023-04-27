import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String searchHint;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? searchonPressed;
  final void Function()? notifyPressed;
  final void Function()? favPressed;

  const CustomAppbar(
      {super.key,
      required this.searchHint,
      required this.controller,
      required this.onChanged,
      required this.searchonPressed,
      required this.notifyPressed,
      required this.favPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: searchHint,
                filled: true,
                fillColor: Colors.grey[600],
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search_outlined),
                  onPressed: searchonPressed,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey[700], borderRadius: BorderRadius.circular(20)),
          child: IconButton(
              iconSize: 30,
              onPressed: notifyPressed,
              icon: const Icon(Icons.notifications_active_outlined)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey[700], borderRadius: BorderRadius.circular(20)),
          child: IconButton(
              iconSize: 30,
              onPressed: favPressed,
              icon: const Icon(Icons.favorite_border_outlined)),
        ),
      ],
    );
  }
}
