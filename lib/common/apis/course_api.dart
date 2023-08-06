import 'package:u_course_example/common/entities/course.dart';
import 'package:u_course_example/common/utils/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    final response = await HttpUtil().post('api/courseList');

    return CourseListResponseEntity.fromJson(response);
  }
}
