import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:e_learning/core/config/components/parse_time.dart';
import 'package:e_learning/core/config/components/spinkit.dart';
import 'package:e_learning/feature/exercise/data/models/get_exercise_by_course_res.dart';
import 'package:e_learning/feature/exercise/presentation/manager/get_exercise_by_course/get_exercise_by_course_bloc.dart';
import 'package:e_learning/feature/exercise/presentation/manager/get_exercise_by_course/get_exercise_by_course_event.dart';
import 'package:e_learning/feature/exercise/presentation/manager/get_exercise_by_course/get_exercise_by_course_state.dart';
import 'package:e_learning/feature/exercise/presentation/pages/create_exercise_page.dart';
import 'package:e_learning/feature/exercise/presentation/pages/detail_exercise_page.dart';
import 'package:e_learning/feature/lecture/presentation/pages/create_lecture_page.dart';
import 'package:e_learning/main.dart';

class ExercisePage extends StatefulWidget {
  final String? idCourse;
  final String? nameCourse;

  const ExercisePage({Key? key, this.idCourse, this.nameCourse})
      : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExerciseByCourseBloc, GetExerciseByCourseState>(
        builder: (context, state) {
      if (state is Empty) {
        getCourse();
      } else if (state is Loaded) {
        return _list(state.data);
      } else if (state is Loading) {
        return SpinkitLoading();
      } else if (state is Error) {
        return Center(
          child: Text("Lỗi hệ thống"),
        );
      }
      return Container();
    });
  }

  /// danh sách bài tập
  Widget _list(
    List<GetExerciseByCourseData>? list,
  ) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height - size.width / 7 - size.width / 5,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width / 25,
            right: size.width / 25,
            top: size.width / 40),
        child: Column(
          children: [
            _header(
              datetime: DateFormat('dd-MM-yyyy').format(DateTime.now()),
              countExercise: list?.length,
              idCourse: widget.idCourse,

              ///check role
              iconButton: appUser?.role == "teacher"
                  ? IconButton(
                      icon: Icon(
                        Icons.add,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CreateLecturePage(
                        //               idCourse: widget.idCourse,
                        //             )));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateExercisePage(
                                      idCourse: widget.idCourse!,
                                      nameCourse: widget.nameCourse,
                                    )));
                      },
                    )
                  : null,
            ),
            list!.isNotEmpty
                ? Container(
                    width: size.width - size.width / 20,
                    height: size.width / 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(top: size.width / 20),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return _item(
                              time:
                                  "${parseStringToTime(textTime: list[index].allowSubmission ?? null)} "
                                  "- ${parseStringToTime(textTime: list[index].submissionDeadline ?? null)}",
                              titleExercise: list[index].titleExercise,
                              descriptionExercise:
                                  list[index].descriptionExercise == null
                                      ? ""
                                      : list[index].descriptionExercise,
                              data: list[index]);
                        },
                        itemCount: list.length,
                      ),
                    ),
                  )
                : Center(child: Text("Invail exercise")),
          ],
        ),
      ),
    );
  }

  Widget _header(
      {String? datetime,
      int? countExercise,
      String? idCourse,
      Widget? iconButton}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - size.width / 25,
      height: size.width / 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: size.width / 30, bottom: size.width / 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    datetime!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width / 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "You have $countExercise studies",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius:
                      BorderRadius.all(Radius.circular(size.width / 40))),
              child: iconButton)
        ],
      ),
    );
  }

  Widget _item(
      {String? time,
      String? titleExercise,
      String? descriptionExercise,
      GetExerciseByCourseData? data}) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width / 30,
          height: size.width / 3,
          child: Column(
            children: [
              Icon(
                Icons.circle,
                color: Colors.lightBlue.withOpacity(0.5),
                size: size.width / 30,
              ),
              Container(
                  width: size.width / 100,
                  height: size.width / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius:
                        BorderRadius.all(Radius.circular(size.width / 20)),
                  )),
            ],
          ),
        ),
        _card(
            time: time,
            titleExercise: titleExercise,
            descriptionExercise: descriptionExercise,
            data: data),
      ],
    );
  }

  Widget _card(
      {String? time,
      String? titleExercise,
      String? descriptionExercise,
      GetExerciseByCourseData? data}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 1.2,
      height: size.width / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _timeDeadLine(time: time),
          Padding(
            padding: EdgeInsets.only(bottom: size.width / 20),
            child: Container(
              width: size.width / 1,
              height: size.width / 5,
              decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(0.3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(size.width / 25),
                  )),
              child: Padding(
                padding: EdgeInsets.all(size.width / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _content(
                        titleExercise: titleExercise,
                        descriptionExercise: descriptionExercise),

                    ///check role
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailExercisePage(
                                        submissionDeadline:
                                            data!.submissionDeadline,
                                        allowSubmission: data.allowSubmission,
                                        descriptionExercise:
                                            data.descriptionExercise,
                                        idExercise: data.iId,
                                        nameExercise: data.titleExercise,
                                      )));
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          size: size.width / 10,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content({String? titleExercise, String? descriptionExercise}) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// assignment_turned_in_rounded

          Image.asset(
            "assets/icons/notes.png",
            fit: BoxFit.cover,
            width: size.width / 10,
            height: size.width / 10,
          ),

          SizedBox(
            width: size.width / 20,
          ),
          Container(
            width: size.width / 2.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleExercise!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width / 25),
                ),
                Text(
                  descriptionExercise!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width / 35),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width / 10,
          ),
        ],
      ),
    );
  }

  Widget _timeDeadLine({String? time}) {
    Size size = MediaQuery.of(context).size;

    return Text(
      time!,
      style: TextStyle(
          fontSize: size.width / 30,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    );
  }

  void getCourse() {
    BlocProvider.of<GetExerciseByCourseBloc>(context)
        .add(GetExerciseByCourseEventE(idCourse: widget.idCourse));
  }
}
