/*

AUTH REPO >> Is used to outline the possible auth operations for the app

 */

import 'package:flutter_application_1/Features/Auth/domain/models/app_user.dart';

abstract class AuthRepo{
  //Login
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  //Register
  Future<AppUser?> registerWithEmailPassword(String name, String email, String password);
  //Logout
  Future<void>logout();
  //get current user
  Future<AppUser?>getCurrentUser();
  //password reset
  Future<String?>sendPasswordResetEmail(String email);
  // delete account
  Future<AppUser?>deleteAccount();
}