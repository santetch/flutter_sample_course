import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/common/values/colors.dart';
import 'package:u_course_example/pages/home/bloc/home_blocs.dart';
import 'package:u_course_example/pages/home/bloc/home_states.dart';
import 'package:u_course_example/pages/home/home_controller.dart';
import 'package:u_course_example/pages/home/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(
          avatarUrl: _homeController.userProfile?.avatar.toString(),
        ),
        body: BlocBuilder<HomeBlocs, HomeStates>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: homePageText(
                      text: "Hello",
                      color: AppColors.primaryThreeElementText,
                      top: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: homePageText(
                      text: _homeController.userProfile?.name ?? 'username',
                      color: AppColors.primaryText,
                      top: 5,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.h),
                  ),
                  SliverToBoxAdapter(child: searchView()),
                  SliverToBoxAdapter(child: slidersView(context, state)),
                  SliverToBoxAdapter(child: menuView()),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 0.w,
                    ),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.6,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.courseItems.length,
                        (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: courseGrid(state.courseItems[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
