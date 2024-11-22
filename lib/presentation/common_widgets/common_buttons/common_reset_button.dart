import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonResetButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CommonResetButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue)),
          onPressed: () {
            formKey.currentState!.reset();
          },
          child: const Text('Reset',style: TextStyle(fontSize: 18,color: Colors.white))),
    );
  }
}
