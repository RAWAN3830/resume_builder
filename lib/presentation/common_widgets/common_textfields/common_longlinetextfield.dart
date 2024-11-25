import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonLonglineTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  const CommonLonglineTextfield({super.key, required this.controller, required this.hintText, required this.errorText,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (controller.text.isEmpty) {
            return 'Enter Career Obj';
          }
          return null;
        },
        onSaved: (value) {
          controller.text = value ?? '';
        },
        maxLines: 6,
        decoration:  InputDecoration(
          border: OutlineInputBorder(),
          hintText:hintText,
        ),
      ),
    );
  }
}
