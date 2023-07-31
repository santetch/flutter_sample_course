import 'package:shared_preferences/shared_preferences.dart';
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

  bool isOnBoardingCompleted() {
    return _prefs.getBool(AppConstants.IS_ON_BOARDING_COMPLETED) ?? false;
  }
}
