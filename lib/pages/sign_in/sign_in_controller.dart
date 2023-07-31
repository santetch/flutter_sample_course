import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/common/widgets/flutter_toast.dart';
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
          toastInfo(msg: "Email cannot be empty");
          return;
        }

        if (password.isEmpty) {
          toastInfo(msg: "Password cannot be empty");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user == null) {
            toastInfo(msg: "Wrong User or Password");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "User not verified");
            return;
          }

          final user = credential.user;

          if (user != null) {
            // verified user

            print("user verified");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            // we had some weird error

            toastInfo(msg: "You should register!");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "Wrong User or Password");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong User or Password");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Email format not valid");
          }
        }
      }
    } catch (e) {}
  }
}
