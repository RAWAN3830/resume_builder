import 'package:flutter/material.dart';

import '../../../domain/personal_info.dart';

abstract class PersonalInfoEvent {}

class AddPersonalInfoEvent extends PersonalInfoEvent {
  final PersonalInfoModel personalInfoModel;
  final BuildContext context;

  AddPersonalInfoEvent(this.personalInfoModel, this.context);
}
