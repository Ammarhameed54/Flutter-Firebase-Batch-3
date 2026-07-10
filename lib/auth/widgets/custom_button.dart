import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 16),
          child: Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        )),
      ),
    );
  }
}