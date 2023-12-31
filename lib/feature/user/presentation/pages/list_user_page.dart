import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning/core/config/components/card_widget.dart';
import 'package:e_learning/core/config/injection_container.dart';
import 'package:e_learning/feature/exercise/presentation/widgets/appbar_custom.dart';
import 'package:e_learning/feature/user/presentation/manager/get_all_teacher/get_all_teacher_bloc.dart';
import 'package:e_learning/feature/user/presentation/pages/get_all_user_page.dart';
import 'package:e_learning/feature/user/presentation/widgets/delete_teacher.dart';

class ListUserPage extends StatefulWidget {
  static const String routeName = "/ListUserPage";

  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context, title: "List Account"),
      body: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width / 25,
            right: size.width / 25,
          ),
          child: Column(
            children: <Widget>[
              card(
                  title: "List Teacher",
                  colorCard: Colors.lightBlueAccent,
                  colorText: Colors.white,
                  context: context,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (_) => sl<GetAllTeacherBloc>(),
                                  child: GetAllUserPage(
                                    teacherPage: true,
                                  ),
                                )));
                  }),
              card(
                  title: "List Student",
                  colorCard: Colors.lightBlueAccent,
                  colorText: Colors.white,
                  context: context,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (_) => sl<GetAllTeacherBloc>(),
                                  child: GetAllUserPage(
                                    teacherPage: false,
                                  ),
                                )));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
