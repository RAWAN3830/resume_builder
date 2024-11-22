import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/strings.dart';

class CommonSaveButton extends StatelessWidget {

  final GlobalKey<FormState> formKey;
  const CommonSaveButton(
      {super.key,
        required this.formKey,
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print('Submit');
              formKey.currentState!.save();

              var snackbar = const SnackBar(
                  content: Text('Submitted sucessfully.'));
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackbar);
            }
          },
          child:  Text(
            Strings.save,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )),
    );
  }
}
