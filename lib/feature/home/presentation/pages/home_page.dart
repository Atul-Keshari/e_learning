import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/core/config/components/page_routers.dart';
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/config/injection_container.dart';
import 'package:e_learning/feature/course/presentations/pages/get_course_page.dart';
import 'package:e_learning/feature/home/presentation/manager/get_dashboard/get_dashboard_bloc.dart';
import 'package:e_learning/feature/home/presentation/widgets/bottom_navi_bar_cus.dart';
import 'package:e_learning/feature/home/presentation/widgets/content_widget.dart';
import 'package:e_learning/feature/home/presentation/widgets/filter_widget.dart';
import 'package:e_learning/feature/home/presentation/widgets/gridview.dart';
import 'package:e_learning/feature/home/presentation/widgets/header_widget.dart';
import 'package:e_learning/main.dart';

class HomePage extends StatefulWidget {
  static const String routerName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar:const CustomBottomNavigationBar(
          index: 0,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: appUser?.role == "admin"
              ? Padding(
                  padding: EdgeInsets.only(
                      left: size.width / 25,
                      right: size.width / 25,
                      top: size.width / 10),
                  child: Column(
                    children: [
                      header(context: context, name: appUser?.fullName),
                      SizedBox(
                        height: size.width / 15,
                      ),
                      buildBody(context),
                    ],
                  ),
                )
              : SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width / 25,
                            right: size.width / 25,
                            top: size.width / 10),
                        child: SizedBox(
                          width: size.width,
                          height: size.height / 4,
                          child: Column(
                            children: [
                              header(context: context, name: appUser?.fullName),
                              filter(context: context),
                              content(
                                  title: "Recent courses", context: context),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          width: size.width,
                          height: size.height - size.height / 2.5,
                          child: const GetCoursePage(
                            showAll: false,
                          )),
                    ],
                  ),
                ),
        ));
  }
}

BlocProvider<GetDashboardBloc> buildBody(BuildContext context) {
  return BlocProvider(
      create: (_) => sl<GetDashboardBloc>(), child: const GridViewWidget());
}

Widget logOut({@required BuildContext? context}) {
  return TextButton(
      onPressed: () {
        prefs!.setString(SAVE_LOGIN_RESPONSE, '');
        Navigator.pushNamedAndRemoveUntil(context!, PageRoutes.onBoardingPage,
            (Route<dynamic> route) => false);
      },
      child:const Text('Out'));
}
