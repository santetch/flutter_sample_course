import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_bloc.dart';

class SingInController {
  final BuildContext context;

  const SingInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;

        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          //
        }

        if (password.isEmpty) {
          //
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user.isNull) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }

          final user = credential.user;

          if (user != null) {
            // verified user
          } else {
            // we had some weird error
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
