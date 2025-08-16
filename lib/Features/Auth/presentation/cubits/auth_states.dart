/*

AUTH STATES

 */

import 'package:flutter_application_1/Features/Auth/domain/models/app_user.dart';

abstract class AuthState{}
//INITIALIZING
class AuthInitial extends AuthState{}

//LOADING
class AuthLoading extends AuthState{}

//AUTHENTICATED
class Authenticated extends AuthState{
  final AppUser user;
  Authenticated(this.user);
}

//UNAUTHENTICATED
class Unauthenticated extends AuthState{}

//Errors
class AuthError extends AuthState{
  final String message;
  AuthError(this.message);
}