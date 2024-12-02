// abstract class LoginState{
//   const LoginState();
// }
//
// class LoginInitial extends LoginState{}
// class LoginLoading extends LoginState{}
//
// class LoginSuccess extends LoginState{
//   final String userId;
//   LoginSuccess(this.userId);
// }
//
// class LoginFailure extends LoginState{
//   final String error;
//   const LoginFailure(this.error);
// }

import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String uid;
  LoginSuccess(this.uid);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}