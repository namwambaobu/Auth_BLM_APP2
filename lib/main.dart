import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Auth/Themes/light_mode.dart';
import 'package:flutter_application_1/Features/Auth/components/loading_screen.dart';
import 'package:flutter_application_1/Features/Auth/data/firebase_auth_repo.dart';
import 'package:flutter_application_1/Features/Auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_application_1/Features/Auth/presentation/cubits/auth_states.dart';
import 'package:flutter_application_1/Features/Auth/presentation/pages/auth_page.dart';
import 'package:flutter_application_1/Features/Home/presentation/pages/home_page.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //Firebase Set up
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //RunApp
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //authrepo
  final firebaseAuthRepo = FirebaseAuthRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //PROVIDES THE CUBITS TO THE APP
      providers: [
        //AUTH CUBIT
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(authRepo: firebaseAuthRepo)..checkAuth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            print(state);
            //unauthenticated
            if (state is Unauthenticated) {
              return AuthPage();
            }
            //authenticared -> HomwPage()
            if (state is Authenticated) {
              return HomePage();
            }
            //loading...
            else {
              return LoadingScreen();
            }
          },
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }
}
