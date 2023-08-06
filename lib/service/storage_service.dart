import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_course_example/common/entities/entities.dart';
import 'package:u_course_example/common/values/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setValue(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> removeValue(String key) async {
    return await _prefs.remove(key);
  }

  String getUserToken() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  UserItem? getUserProfile() {
    final profileOffline =
        _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";

    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }

    return null;
  }

  bool isOnBoardingCompleted() {
    return _prefs.getBool(AppConstants.IS_ON_BOARDING_COMPLETED) ?? false;
  }

  bool isLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }
}
