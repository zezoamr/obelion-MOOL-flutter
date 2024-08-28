import 'package:flutter/material.dart';

Widget buildTextField(String label, {bool isPassword = false}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 162, 162, 162)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
