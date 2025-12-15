import 'package:flutter/material.dart';

class TxtFild extends StatelessWidget {
  final String label;
  final String hintTxt;
  final TextEditingController controller;

  const TxtFild({
    super.key,
    required this.label,
    required this.hintTxt,
    required this.controller,
  });

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white),

            decoration: InputDecoration(
              hintText: hintTxt,
              filled: true,
              fillColor: Colors.black,

              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
