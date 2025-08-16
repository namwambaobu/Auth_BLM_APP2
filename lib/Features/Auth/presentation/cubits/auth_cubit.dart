/*

AUTH CUBIT >> does the state management

 */

import 'package:flutter_application_1/Features/Auth/domain/models/app_user.dart';
import 'package:flutter_application_1/Features/Auth/presentation/cubits/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/auth_repo.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepo authRepo;

  AppUser? _currentUser;

  AuthCubit({required this.authRepo}): super(AuthInitial());

  //get current user
AppUser? get currentUser => _currentUser;

//cHECK IF USER IS AUTHENTICATED
void checkAuth()async {
  //Loading
  emit(AuthLoading());

  //get current user
  final AppUser? user = await authRepo.getCurrentUser();

  //check if user exists then authenticated, if not user > unauthenticated
  if (user != null) {
    _currentUser = user;
    emit(Authenticated(user));
  } else {
    emit(Unauthenticated());
  }
}
  //login with email + pw
  Future<void> login(String email, String pw) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(email, pw);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    }
    catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  //Register
  Future<void> register(String name,String email, String pw) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailPassword(name, email, pw);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    }
    catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

//logout

}