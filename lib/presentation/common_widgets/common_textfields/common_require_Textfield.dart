import 'package:flutter/material.dart';

class CommonRequiredTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  const CommonRequiredTextFields({super.key, required this.controller, required this.labelText, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        controller: controller,
        validator: (value) {
          if (controller.text.isEmpty) {
            return labelText;
          }
          return null;
        },
        onSaved: (value) {
          controller.text = value ?? '';
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.5,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: 'CustomFont',
          ),
          errorStyle: TextStyle(
            fontFamily: 'CustomFont',
          ),
        ),
      )

    );
  }
}
