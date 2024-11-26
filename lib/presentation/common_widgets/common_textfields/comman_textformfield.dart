import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextformfield extends StatelessWidget {
  // final String name;
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final IconData icon;
  const CommonTextformfield(
      {super.key,
      required this.hintText,
      required this.icon,
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
        maxLength: 10,
        decoration:  InputDecoration(
          hintText: hintText,
            // hintText: 'Name',
            // prefixIcon: Icon(CupertinoIcons.person_alt_circle_fill, size: 30)
          prefixIcon: Icon(icon)
        ));
  }
}
