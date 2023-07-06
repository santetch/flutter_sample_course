import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: 375.w,
          child: Stack(
            children: [
              PageView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 354.w,
                        height: 345.h,
                        child: const Text("Image 1"),
                      ),
                      SizedBox(
                        child: Text(
                          "First see learning",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        width: 375.w,
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: Text(
                          "Forget about a for or paper all knowledge in one learning",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        width: 325.w,
                        height: 50.h,
                        margin: EdgeInsets.only(
                          top: 100.h,
                          left: 25.w,
                          right: 25.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple,
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
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
