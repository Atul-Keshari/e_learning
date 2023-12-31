import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_learning/core/config/components/page_routers.dart';
import 'package:e_learning/feature/answer/presentation/pages/grading_assignment_page.dart';
import 'package:e_learning/feature/answer/presentation/widgets/haha.dart';
import 'package:e_learning/feature/class/presentations/pages/add_class_page.dart';
import 'package:e_learning/feature/class/presentations/pages/create_class_page.dart';
import 'package:e_learning/feature/class/presentations/pages/edit_class_page.dart';
import 'package:e_learning/feature/class/presentations/pages/func_class_page.dart';
import 'package:e_learning/feature/class/presentations/pages/remove_class_page.dart';
import 'package:e_learning/feature/course/presentations/pages/add_course_page.dart';
import 'package:e_learning/feature/course/presentations/pages/edit_course_page.dart';
import 'package:e_learning/feature/course/presentations/pages/func_course_page.dart';
import 'package:e_learning/feature/course/presentations/pages/get_course_page.dart';
import 'package:e_learning/feature/course/presentations/pages/remove_course_page.dart';
import 'package:e_learning/feature/exercise/presentation/pages/detail_course_page.dart';
import 'package:e_learning/feature/exercise/presentation/pages/detail_exercise_page.dart';
import 'package:e_learning/feature/exercise/presentation/pages/grade_exercise_teacher_page.dart';
import 'package:e_learning/feature/exercise/presentation/pages/submit_exercise_page.dart';
import 'package:e_learning/feature/home/presentation/pages/function_page.dart';

import 'package:e_learning/feature/home/presentation/pages/home_page.dart';
import 'package:e_learning/feature/lecture/presentation/pages/create_lecture_page.dart';
import 'package:e_learning/feature/list_teacher/presentations/pages/add_teacher_to_course_page_page.dart';
import 'package:e_learning/feature/list_teacher/presentations/widgets/body_add_teacher_to_course.dart';
import 'package:e_learning/feature/notifi/presentation/pages/notifi_page.dart';
import 'package:e_learning/feature/onboarding/ui/onboarding_page.dart';
import 'package:e_learning/feature/onboarding/ui/onboarding_screen.dart';
import 'package:e_learning/feature/password/change_pw/presentation/pages/change_pw_page.dart';
import 'package:e_learning/feature/password/forgot_pw/presentation/pages/forgot_pw_page.dart';
import 'package:e_learning/feature/password/forgot_pw/presentation/pages/set_new_pw_page.dart';
import 'package:e_learning/feature/sign_in/data/models/login_data.dart';
import 'package:e_learning/feature/sign_in/presentations/pages/sign_in_page.dart';
import 'package:e_learning/feature/sign_up/presentation/pages/sign_up_page.dart';
import 'package:e_learning/feature/user/presentation/pages/change_pw_page.dart';
import 'package:e_learning/feature/user/presentation/pages/func_user_page.dart';
import 'package:e_learning/feature/user/presentation/pages/get_all_user_page.dart';
import 'package:e_learning/feature/user/presentation/pages/list_user_page.dart';
import 'package:e_learning/feature/user/presentation/pages/reset_pw_page.dart';
import 'package:e_learning/feature/user/presentation/pages/sign_up_page.dart';
import 'package:e_learning/feature/user/presentation/widgets/delete_teacher.dart';
import 'package:e_learning/test.dart';
import 'core/config/injection_container.dart' as di;
import 'feature/answer/presentation/pages/info_answer_page.dart';
import 'feature/course/presentations/pages/list_score_page.dart';
import 'feature/exercise/presentation/pages/create_exercise_page.dart';
import 'dart:async';

import 'feature/lecture/presentation/pages/lecture_page.dart';

import 'feature/user/presentation/pages/change_info_user_page.dart';
import 'feature/user/presentation/pages/delete_user_page.dart';
import 'feature/user/presentation/pages/personal_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

SharedPreferences? prefs;
LoginData? appUser;

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignInPage(),
        //CreateExercisePage(idCourse: "eb5f9ca4-0d73-4dbb-a28a-03dc76e5cdb6",),
        //  initialRoute: widget.initScreen ==0 || widget.initScreen==null ?? ,
        routes: {
          PageRoutes.onBoardingPage: (context) => OnBoardingPage(),
          PageRoutes.onBoardingScreen: (context) => OnBoardingScreen(),
          PageRoutes.signInPage: (context) => SignInPage(),
          PageRoutes.forgotPasswordPage: (context) => ForgotPasswordPage(),
          PageRoutes.setNewPasswordPage: (context) => SetNewPasswordPage(),
          PageRoutes.signUpPage: (context) => SignUpPage(),
          PageRoutes.homePage: (context) => HomePage(),
          PageRoutes.addCoursePage: (context) => AddCoursePage(),
          PageRoutes.addTeacherToCoursePage: (context) =>
              AddTeacherToCoursePage(),
          PageRoutes.bodyAddTeacherToCourse: (context) =>
              BodyAddTeacherToCourse(),
          PageRoutes.addClassPage: (context) => AddClassPage(),
          PageRoutes.detailCoursePage: (context) => DetailCoursePage(),
          PageRoutes.detailExercisePage: (context) => DetailExercisePage(),
          PageRoutes.createExercisePage: (context) => CreateExercisePage(),
          PageRoutes.createLecturePage: (context) => CreateLecturePage(),
          PageRoutes.submitExercisePage: (context) => SubmitExercisePage(),
          PageRoutes.infoAnswerPage: (context) => InfoAnswerPage(),
          PageRoutes.gradeExerciseTeacherPage: (context) =>
              GradeExerciseTeacherPage(),
          PageRoutes.gradingAssignmentPage: (context) =>
              GradingAssignmentPage(),
          PageRoutes.examplePage: (context) => ExamplePage(),
          PageRoutes.functionPage: (context) => FunctionPage(),
          PageRoutes.funcClassPage: (context) => FuncClassPage(),
          PageRoutes.createClassPage: (context) => CreateClassPage(),
          PageRoutes.getCoursePage: (context) => GetCoursePage(),
          PageRoutes.funcCoursePage: (context) => FuncCoursePage(),
          PageRoutes.removeCoursePage: (context) => RemoveCoursePage(),
          PageRoutes.editCoursePage: (context) => EditCoursePage(),
          PageRoutes.funcUserPage: (context) => FuncUserPage(),
          PageRoutes.editClassPage: (context) => EditClassPage(),
          PageRoutes.removeClassPage: (context) => RemoveClassPage(),
          PageRoutes.changeInfoUserPage: (context) => ChangeInfoUserPage(),
          PageRoutes.changePwPage: (context) => ChangePwPage(),
          PageRoutes.deleteUserPage: (context) => DeleteUserPage(),
          PageRoutes.deleteTeacherPage: (context) => DeleteTeacherPage(),
          PageRoutes.resetPwPage: (context) => ResetPwPage(),
          PageRoutes.listUserPage: (context) => ListUserPage(),
          PageRoutes.lecturePage: (context) => LecturePage(),
          PageRoutes.listScorePage: (context) => ListScorePage(),
          PageRoutes.notifiPage: (context) => NotifiPage(),
          PageRoutes.personalPage: (context) => PersonalPage(),
          PageRoutes.changePasswordPage: (context) => ChangePasswordPage(),
          PageRoutes.getAllUserPage: (context) => GetAllUserPage(),
          PageRoutes.test: (context) => Test(),
        }, supportedLocales: [
      Locale('en', 'US')
    ]);
  }
}
