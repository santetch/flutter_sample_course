import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/common/values/colors.dart';
import 'package:u_course_example/pages/widgets/base_text_widgets.dart';
import 'package:u_course_example/routes/routes.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset("assets/icons/menu.png"),
        ),
        reusableText("Profile"),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset("assets/icons/more-vertical.png"),
        ),
      ],
    ),
  );
}

Widget profileIconAndButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

const imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achivement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};

Widget buildListView(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 25.w),
    child: Column(
      children: [
        ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 15.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement,
                    ),
                    child: Image.asset(
                        "assets/icons/${imagesInfo.values.elementAt(index)}"),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  reusableText(imagesInfo.keys.elementAt(index))
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
