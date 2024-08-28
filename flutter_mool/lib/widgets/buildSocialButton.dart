import 'package:flutter/material.dart';

Widget buildSocialButton(IconData icon) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: IconButton(
      icon: Icon(
        icon,
        size: 30,
      ),
      onPressed: () {},
    ),
  );
}
