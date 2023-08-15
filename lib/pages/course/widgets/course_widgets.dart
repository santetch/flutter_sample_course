import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/common/values/colors.dart';
import 'package:u_course_example/pages/widgets/base_text_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    title: reusableText("Course Detail"),
    centerTitle: true,
  );
}

Widget thumbNail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: AssetImage("assets/icons/Image(1).png"),
      ),
    ),
  );
}

Widget menuView() {
  return SizedBox(
    width: 325.w,
    child: Row(children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(7.w),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: reusableText(
            "Author",
            weight: FontWeight.normal,
            size: 10,
          ),
        ),
      ),
      _iconAndNum("assets/icons/people.png", 0),
      _iconAndNum("assets/icons/home.png", 0),
    ]),
  );
}

Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement),
    ),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

const imagesInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "67 Downloadable Resources": "download_detail.png",
};

Widget courseSummaryView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () {
            //Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    "assets/icons/${imagesInfo.values.elementAt(index)}",
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                reusableText(
                  imagesInfo.keys.elementAt(index),
                  color: AppColors.primarySecondaryElementText,
                  size: 11,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildLessonsList() {
  return Container(
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.circular(10.w),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/icons/Image(1).png"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listContainer(),
                  _listContainer(
                    size: 10,
                    color: AppColors.primarySecondaryElementText,
                    weight: FontWeight.normal,
                  ),
                ],
              )
            ],
          ),
          Container(
            child: Image(
              height: 24.h,
              width: 24.h,
              image: const AssetImage("assets/icons/arrow_right.png"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _listContainer({
  int size = 13,
  Color color = AppColors.primaryText,
  FontWeight weight = FontWeight.bold,
}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(left: 15.w),
    child: Text(
      "UI Design",
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: weight,
      ),
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusableText(
          num.toString(),
          weight: FontWeight.normal,
          color: AppColors.primaryThreeElementText,
          size: 11,
        ),
      ],
    ),
  );
}
