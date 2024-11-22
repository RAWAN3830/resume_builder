import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonRequiredTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final String errortext;
  const CommonRequiredTextFields({super.key, required this.controller, required this.hinttext, required this.errortext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        validator: (value){
          if ( controller.text.isEmpty)
          {return hinttext;}
          return null;
        },
        onSaved: (value){
          controller.text = value ?? '';
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hinttext,),
      ),
    );
  }
}
