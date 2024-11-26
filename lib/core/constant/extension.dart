import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext{
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
}

extension BuildContextExtension on BuildContext {
  Future<void> push(BuildContext context, {required Widget target}) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => target,
    ));
  }

  Future<void> pop(BuildContext context) async {
    Navigator.of(context).pop();
  }

  Future<void> pushAndRemoveUntil(BuildContext context,
      {required Widget target}) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => target,
        ),
            (route) => false);
  }
}