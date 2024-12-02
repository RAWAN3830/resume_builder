//
// abstract class LoginEvent {
//   const LoginEvent();
// }
//
// class LoginUserEvent extends LoginEvent {
//   final String email;
//   final String password;
//
//   const LoginUserEvent({
//     required this.email,
//     required this.password,
//
//   });
//
// }

import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {}

class LoginUserEvent extends LoginEvent {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});
}