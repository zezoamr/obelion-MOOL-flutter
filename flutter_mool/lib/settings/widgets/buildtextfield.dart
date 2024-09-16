import 'package:flutter/material.dart';

Widget buildTextField(
    String label, TextEditingController controller, BuildContext context,
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
                    ? IconButton(
                        icon: const Icon(Icons.calendar_today,
                            color: Colors.black54),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999),
                            lastDate: DateTime(2050),
                          );
                          // if (pickedDate != null) {
                          //   controller.text =
                          //       "${pickedDate.toLocal()}".split(' ')[0];
                          // }
                          if (pickedDate != null) {
                            controller.text =
                                "${pickedDate.day}${pickedDate.day == 1 ? 'st' : pickedDate.day == 2 ? 'nd' : pickedDate.day == 3 ? 'rd' : 'th'}, ${pickedDate.month == 1 ? 'January' : pickedDate.month == 2 ? 'February' : pickedDate.month == 3 ? 'March' : pickedDate.month == 4 ? 'April' : pickedDate.month == 5 ? 'May' : pickedDate.month == 6 ? 'June' : pickedDate.month == 7 ? 'July' : pickedDate.month == 8 ? 'August' : pickedDate.month == 9 ? 'September' : pickedDate.month == 10 ? 'October' : pickedDate.month == 11 ? 'November' : 'December'} ${pickedDate.year}";
                          }
                        },
                      )
                    : null),
          ),
        ),
      ),
      const SizedBox(height: 15),
    ],
  );
}
