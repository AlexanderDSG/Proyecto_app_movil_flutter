import 'package:flutter/material.dart';

class EditInputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String helperText;

  const EditInputText({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          helperText: helperText,
          helperStyle: const TextStyle(fontSize: 11),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
