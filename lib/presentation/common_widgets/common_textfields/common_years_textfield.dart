import 'package:flutter/cupertino.dart';
import 'package:resume/core/constant/extension.dart';

import '../common_text/common_heading.dart';
import 'comman_textformfield.dart';

class CommonYearsTextfield extends StatelessWidget {
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  const CommonYearsTextfield({super.key, required this.startDateController, required this.endDateController});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeading(title: 'Start Date'),
              CommonTextformfield(
                labelText: 'june 2022',
                controller: startDateController,
                errorText: 'Enter valid value',
              ),
            ],
          ),
        ),
        SizedBox(width: context.width(context) * 0.05),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonHeading(title: 'End Date'),
              CommonTextformfield(
                labelText: 'month year',
                controller: endDateController,
                errorText: 'Enter valid value',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
