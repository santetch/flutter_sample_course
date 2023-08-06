import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/common/values/colors.dart';
import 'package:u_course_example/common/values/constant.dart';
import 'package:u_course_example/pages/home/bloc/home_blocs.dart';
import 'package:u_course_example/pages/home/bloc/home_events.dart';
import 'package:u_course_example/pages/home/bloc/home_states.dart';

import '../../../common/entities/course.dart';
import '../../widgets/base_text_widgets.dart';

AppBar buildAppBar({String? avatarUrl}) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _createImage(avatarUrl),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText({
  required String text,
  Color color = AppColors.primaryText,
  int top = 0,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(
            15.h,
          ),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 200.w,
              height: 40.w,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  hintText: "search your course",
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomeStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBlocs>().add(HomeDots(value));
          },
          children: [
            _slidersContainer(path: "assets/icons/art.png"),
            _slidersContainer(path: "assets/icons/Image(1).png"),
            _slidersContainer(path: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(
          top: 15.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            GestureDetector(
              child: reusableText(
                "See all",
                color: AppColors.primaryThreeElementText,
                weight: FontWeight.normal,
                size: 10,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        width: 325.w,
        child: Row(
          children: [
            _reusableMenuButtonsText("All", true),
            _reusableMenuButtonsText("Popular", false),
            _reusableMenuButtonsText("Newest", false),
          ],
        ),
      ),
    ],
  );
}

Widget courseGrid(CourseItem item) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: _createImage(
          item.thumbnail,
          defaultImage: "assets/icons/Image(1).png",
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        reusableText(
          item.name ?? '',
          size: 11,
          color: AppColors.primaryElementText,
          maxLines: 1,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 5.h,
        ),
        reusableText(
          item.description ?? '',
          size: 8,
          color: AppColors.primaryFourElementText,
          weight: FontWeight.normal,
          maxLines: 1,
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}

ImageProvider _createImage(
  String? url, {
  String defaultImage = "assets/icons/person.png",
}) {
  if (url != null) {
    return NetworkImage('${AppConstants.SERVER_API_URL}$url');
  }
  return AssetImage(defaultImage);
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget _reusableMenuButtonsText(String text, bool isActive) {
  final color = isActive
      ? AppColors.primaryElement
      : AppColors.primarySecondaryBackground;

  final textColor = isActive
      ? AppColors.primaryElementText
      : AppColors.primarySecondaryElementText;
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(
      left: 15.w,
      right: 15.w,
      top: 5.h,
      bottom: 5.h,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: color),
    ),
    child: reusableText(
      text,
      color: textColor,
      weight: FontWeight.normal,
      size: 10,
    ),
  );
}
