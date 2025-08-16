import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Features/Auth/domain/models/app_user.dart';
import 'package:flutter_application_1/Features/Auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo{

  //access to firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//LOGIN
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try{
      //Attempt to sign in
      UserCredential userCredential= await firebaseAuth
      .signInWithEmailAndPassword(email: email, password: password);

      //Create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email:email,
      );
      //return user
      return user;

    }
        catch(e){
      throw Exception("Login Failed: $e");
        }
  }
//DELETE ACCOUNT
  @override
  Future<AppUser?> deleteAccount() async {
    try{
      //gets the current user
      final user = firebaseAuth
          .currentUser;
      //check if current user is a logged in user
      if (user==null) throw("No user logged in");

      await user.delete();

      //logout
      await logout();

      return null;
    }
    catch(e){
      throw ("Failed to delete account $e");

    }
  }
//GET CURRENT USER
  @override
  Future<AppUser?> getCurrentUser() async {
    //get current user
    final firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser == null) return null;

    //loged user exists
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }
//LOGOUT
  @override
  Future<void> logout() async{
    await firebaseAuth.signOut();
  }
//REGISTER USER
  @override
  Future<AppUser?> registerWithEmailPassword(String name, String email, String password) async {
    try {
      //create user
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //create user
      AppUser user = AppUser(uid:userCredential.user!.uid, email: email);

      //return user
      return user;
    }
    catch(e) {
      throw ("Registration Failed $e");
    }
    }
//SEND PASSWORD RESET EMAIL
  @override
  Future<String>sendPasswordResetEmail(String email) async {
try{
  await firebaseAuth.sendPasswordResetEmail(email: email);
  return "Password reset Email sent! Please check your inbox";

}
    catch(e){
  throw ("An error occurred $e");
    }
  }
  }


