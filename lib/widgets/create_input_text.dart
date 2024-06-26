import 'package:flutter/material.dart';

class CreateInputText extends StatelessWidget {
  final String? initialValue;
  final String label;
  final String hintText;
  final String helperText;


  const CreateInputText({
    Key? key,
    this.initialValue,
    required this.label,
    required this.hintText,
    required this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
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

