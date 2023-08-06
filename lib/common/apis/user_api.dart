import 'package:u_course_example/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    final response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );
  }
}
