import 'package:u_course_example/common/entities/entities.dart';

abstract class CourseDetailEvent {
  const CourseDetailEvent();
}

class TriggerCourseDetail extends CourseDetailEvent {
  final CourseItem courseItem;

  const TriggerCourseDetail(this.courseItem) : super();
}
