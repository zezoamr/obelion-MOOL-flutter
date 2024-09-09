import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  final double width;

  const DividerWithText({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child: Divider(
                color: Color.fromARGB(255, 0, 0, 0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const Expanded(
              child: Divider(
                color: Color.fromARGB(255, 0, 0, 0),
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
