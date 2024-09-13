import 'package:flutter/material.dart';

Widget buildTextField(String label, TextEditingController controller,
    {bool isPassword = false,
    bool isVerified = false,
    bool hasCalendarIcon = false,
    bool isEditable = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
      const SizedBox(height: 5),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          enabled: isEditable,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            suffixIcon: isVerified
                ? const Padding(
                    padding: EdgeInsets.only(top: 15, right: 10),
                    child: Text('Verified',
                        style: TextStyle(color: Colors.green, fontSize: 14)),
                  )
                : (hasCalendarIcon
                    ? const Icon(Icons.calendar_today, color: Colors.black54)
                    : null),
          ),
        ),
      ),
      const SizedBox(height: 15),
    ],
  );
}
