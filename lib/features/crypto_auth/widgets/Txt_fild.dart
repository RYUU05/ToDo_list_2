import 'package:flutter/material.dart';

class TxtFild extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TxtFild({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3.0),
            ),
          ),
        ),
      ],
    );
  }
}
