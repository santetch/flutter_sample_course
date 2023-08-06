import '../../../common/entities/course.dart';

class HomeStates {
  final int index;
  final List<CourseItem> courseItems;

  HomeStates({
    this.index = 0,
    this.courseItems = const <CourseItem>[],
  });

  HomeStates copyWith({
    int? index,
    List<CourseItem>? courseItems,
  }) {
    return HomeStates(
      index: index ?? this.index,
      courseItems: courseItems ?? this.courseItems,
    );
  }
}
