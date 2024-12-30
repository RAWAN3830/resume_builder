import 'package:flutter/material.dart';

class CommonTextformfield extends StatelessWidget {
  // final String name;
  final TextEditingController controller;
  final String labelText;
  final String errorText;
  // final IconData icon;
  const CommonTextformfield(
      {super.key,
      required this.labelText,
      // required this.icon,
      required this.controller,
      required this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter valid value';
        }
        return null;
      },
      onSaved: (value) {
        controller.text = value ?? '';
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
