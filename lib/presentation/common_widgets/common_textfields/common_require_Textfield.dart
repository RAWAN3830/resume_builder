import 'package:flutter/material.dart';
import 'package:resume/core/constant/strings.dart';

class CommonRequiredTextFields extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String errorText;

  const CommonRequiredTextFields({
    super.key,
    required this.controller,
    required this.labelText,
    required this.errorText,
  });

  @override
  _CommonRequiredTextFieldsState createState() =>
      _CommonRequiredTextFieldsState();
}

class _CommonRequiredTextFieldsState extends State<CommonRequiredTextFields> {
   FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
     _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        // focusNode: _focusNode,
        controller: widget.controller,
        style: const TextStyle(
          fontFamily: Strings.uberFont,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorText;
          }
          return null;
        },
        onSaved: (value) {
          widget.controller.text = value ?? '';
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
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
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.black,
          //     width: 2.5,
          //   ),
          // ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            fontFamily: Strings.uberFont,
          ),
          errorStyle: const TextStyle(
            fontFamily: Strings.uberFont,
          ),
        ),
      ),
    );
  }
}
