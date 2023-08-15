import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/common/values/colors.dart';
import 'package:u_course_example/pages/course/widgets/course_widgets.dart';
import 'package:u_course_example/pages/widgets/base_text_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late final id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    //id = data.values.toString();
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 25.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thumbNail(),
                      SizedBox(height: 15.h),
                      menuView(),
                      SizedBox(height: 15.h),
                      reusableText("Course Description"),
                      reusableText(
                        "Queremos brindarte la mejor experiencia de tu vida en USHUAIA, «La Ciudad más Austral del Mundo”. Instalaciones como nunca viste, preparada en todo los sentidos para recibirte. BURTON se suma a nuestra familia de grandes marcas, conviertiendonos en RENTAL EXCLUSIVO en indumentaria y equipamientos de SKI y SNOWBOARD.",
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.primaryThreeElementText,
                        size: 11,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(height: 15.h),
                      goBuyButton("Go Buy"),
                      SizedBox(height: 15.h),
                      reusableText("The Course Includes:", size: 16),
                      SizedBox(height: 15.h),
                      courseSummaryView(context),
                      reusableText("Lessons List:", size: 16),
                      SizedBox(height: 15.h),
                      buildLessonsList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
