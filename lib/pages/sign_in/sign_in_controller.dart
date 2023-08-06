import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:u_course_example/common/entities/entities.dart';
import 'package:u_course_example/common/values/constant.dart';
import 'package:u_course_example/common/widgets/flutter_toast.dart';
import 'package:u_course_example/global.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_bloc.dart';

import '../../common/apis/user_api.dart';

class SingInController {
  final BuildContext context;

  const SingInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
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
            LoginRequestEntity loginRequestEntity = LoginRequestEntity(
                avatar: user.photoURL,
                open_id: user.uid,
                email: user.email,
                name: user.displayName,
                phone: user.phoneNumber,
                // type 1 = email login
                type: 1);

            asyncPostData(loginRequestEntity);

            // verified user
            Global.storageService
                .setValue(AppConstants.STORAGE_USER_TOKEN_KEY, "123");
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

  void asyncPostData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    final result = await UserAPI.login(params: loginRequestEntity);

    if (result.code == 200) {
      try {
        Global.storageService.setValue(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService.setValue(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();

        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/application', (route) => false);
        }
      } catch (e) {}
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: 'unknown error');
    }
  }
}
