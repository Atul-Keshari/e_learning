import 'package:flutter/material.dart';
import 'package:e_learning/core/config/components/card_widget.dart';
import 'package:e_learning/feature/class/presentations/pages/func_class_page.dart';
import 'package:e_learning/feature/course/presentations/pages/func_course_page.dart';
import 'package:e_learning/feature/home/presentation/widgets/bottom_navi_bar_cus.dart';
import 'package:e_learning/feature/user/presentation/pages/func_user_page.dart';
import 'package:e_learning/main.dart';

class FunctionPage extends StatefulWidget {
  static const String routeName = "/FunctionPage";

  const FunctionPage({Key? key}) : super(key: key);

  @override
  _FunctionPageState createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.99),
      bottomNavigationBar: appUser?.role == "admin"
          ? CustomBottomNavigationBar(
              index: 1,
            )
          : null,
      body: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width / 25,
                right: size.width / 25,
                top: size.width / 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Feature",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size.width / 15),
                )),
                card(
                    title: "Class",
                    colorCard: Colors.lightBlueAccent,
                    context: context,
                    colorText: Colors.white,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FuncClassPage()));
                    }),
                card(
                    title: "Course",
                    colorCard: Colors.lightBlueAccent,
                    context: context,
                    colorText: Colors.white,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FuncCoursePage()));
                    }),
                card(
                    title: "User",
                    colorCard: Colors.lightBlueAccent,
                    context: context,
                    colorText: Colors.white,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FuncUserPage()));
                    }),
              ],
            ),
          )),
    );
  }
}
