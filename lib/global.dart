import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/routes/bloc_observer.dart';
import 'package:u_course_example/service/storage_service.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = MyBlocObserver();

    await Firebase.initializeApp();

    storageService = await StorageService().init();
  }
}
