import 'package:flutter/material.dart';

class PaymentMethod {
  final String name;
  final Widget icon;
  final Widget? additionalFields;

  PaymentMethod(
      {required this.name, required this.icon, this.additionalFields});
}
