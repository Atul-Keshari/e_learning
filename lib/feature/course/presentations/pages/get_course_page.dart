import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/core/config/components/spinkit.dart';
import 'package:e_learning/core/config/get_current_user.dart';
import 'package:e_learning/core/config/injection_container.dart';
import 'package:e_learning/feature/course/presentations/manager/get_course/get_course_bloc.dart';
import 'package:e_learning/feature/course/presentations/manager/get_course/get_course_event.dart';
import 'package:e_learning/feature/course/presentations/manager/get_course/get_course_state.dart';
import 'package:e_learning/feature/course/presentations/widgets/body_get_all_course.dart';
import 'package:e_learning/feature/course/presentations/widgets/body_get_course.dart';
import 'package:e_learning/main.dart';

class GetCoursePage extends StatefulWidget {
  final bool? showAll;
  static const String routeName = "/GetCoursePage";
  const GetCoursePage({Key? key, this.showAll}) : super(key: key);

  @override
  _GetCoursePageState createState() => _GetCoursePageState();
}

class _GetCoursePageState extends State<GetCoursePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetCourseBloc>(),
      child: appUser?.role == "admin"
          ? BodyGetAllCourse()
          : (BodyGetCourse(
              changeWithPage: "GetCoursePage",
              showAll: widget.showAll,
            )),
    );
  }
}
