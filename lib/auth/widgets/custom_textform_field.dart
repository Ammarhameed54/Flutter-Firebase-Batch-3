import 'package:flutter/material.dart';

class CustomTextformField extends StatelessWidget {
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final String label;
  final TextEditingController controller;
  const CustomTextformField({
    super.key,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.label,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(label, style: TextStyle(fontSize: 16),),
            ],
          ),
        ),
      
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
