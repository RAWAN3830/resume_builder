import 'package:flutter/material.dart';

class CommonLonglineTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  const CommonLonglineTextfield({super.key, required this.controller, required this.hintText, required this.errorText,});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      validator: (value) {
        if (controller.text.isEmpty) {
          return 'Enter Required Value';
        }
        return null;
      },
      onSaved: (value) {
        controller.text = value ?? '';
      },
      maxLines: 6,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        // hintText: hintText,
        labelText:hintText,
          labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
