import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/common/values/colors.dart';
import 'package:u_course_example/common/values/constant.dart';
import 'package:u_course_example/global.dart';
import 'package:u_course_example/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_course_example/pages/welcome/bloc/welcome_events.dart';
import 'package:u_course_example/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return SizedBox(
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context)
                            .add(WelcomeEvent());
                      },
                      children: [
                        _page(
                          0,
                          context,
                          "Next",
                          "First see Learning",
                          "Forget about a for of paper all knowldget in one learning",
                          "assets/images/reading.png",
                        ),
                        _page(
                          1,
                          context,
                          "Next",
                          "Connect With Everyone",
                          "Always keep in touch with your tuto & friend. let's get connected!",
                          "assets/images/boy.png",
                        ),
                        _page(
                          2,
                          context,
                          "Get Started",
                          "Always Fascinated Learning",
                          "Anywhere, anytime. The time is at your discretion so study whenever you want",
                          "assets/images/man.png",
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 30.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: AppColors.primaryThreeElementText,
                          activeColor: AppColors.primaryThreeElementActive,
                          size: const Size.square(8.0),
                          activeSize: const Size(10.0, 10.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 354.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 2) {
              pageController.animateToPage(
                index + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              Global.storageService
                  .setBool(AppConstants.IS_ON_BOARDING_COMPLETED, true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/signIn", (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                color: AppColors.primaryBackground,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            )),
          ),
        )
      ],
    );
  }
}
