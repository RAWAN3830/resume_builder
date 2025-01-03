import 'package:flutter/material.dart';

class EducationFormController {
  static Map<String, TextEditingController> createControllers() {
    return {
      'institution': TextEditingController(),
      'location': TextEditingController(),
      'degreeType': TextEditingController(),
      'fieldOfStudy': TextEditingController(),
      'startDate': TextEditingController(),
      'endDate': TextEditingController(),
    };
  }

  static void disposeControllers(Map<String, TextEditingController> controllers) {
    for (var controller in controllers.values) {
      controller.dispose();
    }
  }
}