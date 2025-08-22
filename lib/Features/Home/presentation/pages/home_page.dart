import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("H O M E"),
        actions: [
          IconButton(
            onPressed: () {
              final authcubit = context.read<AuthCubit>();
              authcubit.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
