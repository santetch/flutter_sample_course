import 'package:u_course_example/common/entities/course.dart';

abstract class HomeEvents {
  const HomeEvents();
}

class HomeDots extends HomeEvents {
  final int index;

  const HomeDots(this.index) : super();
}

class HomeCourseItem extends HomeEvents {
  final List<CourseItem> courseItems;

  HomeCourseItem(this.courseItems);
}
