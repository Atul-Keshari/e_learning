// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_learning/core/network/network_info.dart';
import 'package:e_learning/feature/answer/data/data_course/get_info_answer_remote.dart';
import 'package:e_learning/feature/answer/data/repo/info_answer_repo_impl.dart';
import 'package:e_learning/feature/answer/domain/repo/info_answer_repo.dart';
import 'package:e_learning/feature/answer/domain/usecase/get_info_answer.dart';
import 'package:e_learning/feature/answer/presentation/manager/get_info_answer/get_info_answer_bloc.dart';
import 'package:e_learning/feature/class/data/data_sources/get_all_class_remote_data_source.dart';
import 'package:e_learning/feature/class/data/repositories/get_all_class_repository_impl.dart';
import 'package:e_learning/feature/class/domain/repositories/get_all_class_repository.dart';
import 'package:e_learning/feature/class/domain/usecases/get_all_class.dart';
import 'package:e_learning/feature/class/presentations/manager/get_all_class/get_all_class_bloc.dart';
import 'package:e_learning/feature/course/data/data_sources/get_course_remote.dart';
import 'package:e_learning/feature/course/data/data_sources/get_member_in_course_remote.dart';
import 'package:e_learning/feature/course/data/data_sources/get_point_student_remote.dart';
import 'package:e_learning/feature/course/data/data_sources/get_point_teacher_remote.dart';
import 'package:e_learning/feature/course/data/repositories/get_course_repo_impl.dart';
import 'package:e_learning/feature/course/data/repositories/get_member_in_course_repo_impl.dart';
import 'package:e_learning/feature/course/data/repositories/get_point_student_repo_impl.dart';
import 'package:e_learning/feature/course/data/repositories/get_point_teacher_repo_impl.dart';
import 'package:e_learning/feature/course/domain/repositories/get_course_repo.dart';
import 'package:e_learning/feature/course/domain/repositories/get_member_in_course_repo.dart';
import 'package:e_learning/feature/course/domain/repositories/get_point_student_repo.dart';
import 'package:e_learning/feature/course/domain/repositories/get_point_teacher_repo.dart';
import 'package:e_learning/feature/course/domain/usecases/get_course.dart';
import 'package:e_learning/feature/course/domain/usecases/get_member_in_course.dart';
import 'package:e_learning/feature/course/domain/usecases/get_point_student.dart';
import 'package:e_learning/feature/course/domain/usecases/get_point_teacher.dart';
import 'package:e_learning/feature/course/presentations/manager/get_course/get_course_bloc.dart';
import 'package:e_learning/feature/course/presentations/manager/get_member_in_course/get_member_in_course_bloc.dart';
import 'package:e_learning/feature/course/presentations/manager/get_point_student/get_point_student_bloc.dart';
import 'package:e_learning/feature/course/presentations/manager/get_point_teacher/get_point_teacher_bloc.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_exercise_by_course_remote.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_exercise_by_id_account_remote.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_grade_exercise_remote.dart';
import 'package:e_learning/feature/exercise/data/data_source/get_info_exercise_remote.dart';
import 'package:e_learning/feature/exercise/data/repositories/get_exercise_by_course_repo_impl.dart';
import 'package:e_learning/feature/exercise/data/repositories/get_exercise_by_id_account_repo_impl.dart';
import 'package:e_learning/feature/exercise/data/repositories/get_grade_exercise_repo_impl.dart';
import 'package:e_learning/feature/exercise/data/repositories/get_info_exercise_repo_impl.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_exercise_by_course_repo.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_exercise_by_id_account_repo.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_grade_exercise_repo.dart';
import 'package:e_learning/feature/exercise/domain/repositories/get_info_exercise_repo.dart';
import 'package:e_learning/feature/exercise/domain/usecase/get_exercise_by_course.dart';
import 'package:e_learning/feature/exercise/domain/usecase/get_exercise_by_id_account.dart';
import 'package:e_learning/feature/exercise/domain/usecase/get_grade_exercise.dart';
import 'package:e_learning/feature/exercise/domain/usecase/get_info_exercise.dart';
import 'package:e_learning/feature/exercise/presentation/manager/get_exercise_by_course/get_exercise_by_course_bloc.dart';
import 'package:e_learning/feature/exercise/presentation/manager/get_exercise_by_id_account/get_exercise_by_id_account_bloc.dart';
import 'package:e_learning/feature/exercise/presentation/manager/get_grade_exercise/get_grade_exercise_bloc.dart';
import 'package:e_learning/feature/exercise/presentation/manager/get_info_exercise/get_info_exercise_bloc.dart';
import 'package:e_learning/feature/home/data/data_course/get_dashboard_remote.dart';
import 'package:e_learning/feature/home/data/repo/get_dashboard_repo_impl.dart';
import 'package:e_learning/feature/home/domain/repo/get_dashboard_repo.dart';
import 'package:e_learning/feature/home/domain/usecase/get_dashboard.dart';
import 'package:e_learning/feature/home/presentation/manager/get_dashboard/get_dashboard_bloc.dart';
import 'package:e_learning/feature/lecture/data/data_source/get_all_lecture_of_course_remote.dart';
import 'package:e_learning/feature/lecture/data/data_source/get_info_lecture_remote.dart';
import 'package:e_learning/feature/lecture/data/repo/get_all_lecture_of_course_repo_impl.dart';
import 'package:e_learning/feature/lecture/data/repo/get_info_lecture_repo_impl.dart';
import 'package:e_learning/feature/lecture/domain/repo/get_all_lecture_of_course_repo.dart';
import 'package:e_learning/feature/lecture/domain/repo/get_info_lecture_repo.dart';
import 'package:e_learning/feature/lecture/domain/usercase/get_all_lecture_of_course.dart';
import 'package:e_learning/feature/lecture/domain/usercase/get_info_lecture.dart';
import 'package:e_learning/feature/lecture/presentation/manager/get_all_lecture_of_course/get_all_lecture_of_course_bloc.dart';
import 'package:e_learning/feature/lecture/presentation/manager/get_info_lecture/get_info_lecture_bloc.dart';
import 'package:e_learning/feature/list_teacher/data/data_sources/list_teacher_remote_data_source.dart';
import 'package:e_learning/feature/list_teacher/data/repositories/list_teacher_repository_impl.dart';
import 'package:e_learning/feature/list_teacher/domain/repositories/list_teacher_repository.dart';
import 'package:e_learning/feature/list_teacher/domain/usecases/get_list_teacher.dart';
import 'package:e_learning/feature/list_teacher/presentations/manager/list_teacher_bloc.dart';
import 'package:e_learning/feature/sign_in/data/data_sources/login_local_data_source.dart';
import 'package:e_learning/feature/sign_in/data/data_sources/login_remote_data_source.dart';
import 'package:e_learning/feature/sign_in/data/repositories/login_repository_impl.dart';
import 'package:e_learning/feature/sign_in/domain/repositories/login_repository.dart';
import 'package:e_learning/feature/sign_in/domain/usecases/get_current_user.dart';
import 'package:e_learning/feature/sign_in/domain/usecases/post_login.dart';
import 'package:e_learning/feature/sign_in/presentations/manager/login_bloc.dart';
import 'package:e_learning/feature/user/data/data_source/get_all_student_remote.dart';
import 'package:e_learning/feature/user/data/data_source/get_all_teacher_remote.dart';
import 'package:e_learning/feature/user/data/repo/get_all_student_repo_impl.dart';
import 'package:e_learning/feature/user/data/repo/get_all_teacher_repo_impl.dart';
import 'package:e_learning/feature/user/domain/repo/get_all_student_repo.dart';
import 'package:e_learning/feature/user/domain/repo/get_all_teacher_repo.dart';
import 'package:e_learning/feature/user/domain/usecase/get_all_student.dart';
import 'package:e_learning/feature/user/domain/usecase/get_all_teacher.dart';
import 'package:e_learning/feature/user/presentation/manager/get_all_student/get_all_student_bloc.dart';
import 'package:e_learning/feature/user/presentation/manager/get_all_teacher/get_all_teacher_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///
  //login
  sl.registerFactory(
    () => LoginBloc(
      lg: sl(),
      cu: sl(),
    ),
  );
  //list teacher
  sl.registerFactory(() => ListTeacherBloc(pr: sl()));
  sl.registerFactory(() => GetCourseBloc(pr: sl()));
  sl.registerFactory(() => GetMemberInCourseBloc(pr: sl()));
  sl.registerFactory(() => GetExerciseByCourseBloc(pr: sl()));
  sl.registerFactory(() => GetExerciseByIdAccountBloc(pr: sl()));
  sl.registerFactory(() => GetInfoExerciseBloc(pr: sl()));
  sl.registerFactory(() => GetInformationAnswerBloc(pr: sl()));
  sl.registerFactory(() => GetGradeExerciseBloc(pr: sl()));
  sl.registerFactory(() => GetDashboardBloc(pr: sl()));
  sl.registerFactory(() => GetAllClassBloc(pr: sl()));
  sl.registerFactory(() => GetAllTeacherBloc(pr: sl()));
  sl.registerFactory(() => GetAllLectureBloc(pr: sl()));
  sl.registerFactory(() => GetInfoLectureBloc(pr: sl()));
  sl.registerFactory(() => GetPointTeacherBloc(pr: sl()));
  sl.registerFactory(() => GetPointStudentBloc(pr: sl()));
  sl.registerFactory(() => GetAllStudentBloc(pr: sl()));

  ///use case
  //login
  sl.registerLazySingleton(() => PostLogin(loginRepository: sl()));
  sl.registerLazySingleton(() => GetCurrentUser(loginRepository: sl()));
  //list teacher
  sl.registerLazySingleton(() => GetListTeacher(sl()));
  sl.registerLazySingleton(() => GetCourse(sl()));
  sl.registerLazySingleton(() => GetMemberInCourse(sl()));
  sl.registerLazySingleton(() => GetExerciseByCourse(sl()));
  sl.registerLazySingleton(() => GetExerciseByIdAccount(sl()));
  sl.registerLazySingleton(() => GetInfoExercise(sl()));
  sl.registerLazySingleton(() => GetInformationAnswer(sl()));
  sl.registerLazySingleton(() => GetGradeExercise(sl()));
  sl.registerLazySingleton(() => GetDashboard(sl()));
  sl.registerLazySingleton(() => GetAllClass(sl()));
  sl.registerLazySingleton(() => GetAllTeacher(sl()));
  sl.registerLazySingleton(() => GetAllLecture(sl()));
  sl.registerLazySingleton(() => GetInfoLecture(sl()));
  sl.registerLazySingleton(() => GetPointTeacher(sl()));
  sl.registerLazySingleton(() => GetPointStudent(sl()));
  sl.registerLazySingleton(() => GetAllStudent(sl()));

  ///repo
  //login
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      networkInfo: sl(),
      loginLocalDataSource: sl(),
      loginRemoteDataSource: sl()));
  //list teacher
  sl.registerLazySingleton<ListTeacherRepository>(
      () => ListTeacherRepositoryImpl(
            listTeacherRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetCourseRepository>(() => GetCourseRepositoryImpl(
        getCourseRemoteDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<GetMemberInCourseRepository>(
      () => GetMemberInCourseRepositoryImpl(
            getMemberInCourseRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetExerciseByCourseRepository>(
      () => GetExerciseByCourseRepositoryImpl(
            getExerciseByCourseRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetExerciseByIdAccountRepository>(
      () => GetExerciseByIdAccountRepositoryImpl(
            getExerciseByIdAccountRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetInfoExerciseRepository>(
      () => GetInfoExerciseRepositoryImpl(
            getInfoExerciseRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetInformationAnswerRepository>(
      () => GetInformationAnswerRepositoryImpl(
            getInformationAnswerRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetGradeExerciseRepository>(
      () => GetGradeExerciseRepositoryImpl(
            getGradeExerciseRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetDashboardRepository>(
      () => GetDashboardRepositoryImpl(
            getDashboardRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetAllClassRepository>(
      () => GetAllClassRepositoryImpl(
            getAllClassRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetAllTeacherRepository>(
      () => GetAllTeacherRepositoryImpl(
            getAllTeacherRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetAllLectureRepository>(
      () => GetAllLectureRepositoryImpl(
            getAllLectureRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetInfoLectureRepository>(
      () => GetInfoLectureRepositoryImpl(
            getInfoLectureRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetPointTeacherRepository>(
      () => GetPointTeacherRepositoryImpl(
            getPointTeacherRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetPointStudentRepository>(
      () => GetPointStudentRepositoryImpl(
            getPointStudentRemoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetAllStudentRepository>(
      () => GetAllStudentRepositoryImpl(
            getAllStudentRemoteDataSource: sl(),
            networkInfo: sl(),
          ));

  ///data source
  //login
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sharedPreferences: sl()));
  //list teacher
  sl.registerLazySingleton<ListTeacherRemoteDataSource>(
      () => ListTeacherRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetCourseRemoteDataSource>(
      () => GetCourseRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetMemberInCourseRemoteDataSource>(
      () => GetMemberInCourseRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetExerciseByCourseRemoteDataSource>(
      () => GetExerciseByCourseRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetExerciseByIdAccountRemoteDataSource>(
      () => GetExerciseByIdAccountRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetInfoExerciseRemoteDataSource>(
      () => GetInfoExerciseRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetInformationAnswerRemoteDataSource>(
      () => GetInformationAnswerRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetGradeExerciseRemoteDataSource>(
      () => GetGradeExerciseRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetDashboardRemoteDataSource>(
      () => GetDashboardRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetAllClassRemoteDataSource>(
      () => GetAllClassRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetAllTeacherRemoteDataSource>(
      () => GetAllTeacherRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetAllLectureRemoteDataSource>(
      () => GetAllLectureRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<GetInfoLectureRemoteDataSource>(
      () => GetInfoLectureRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetPointTeacherRemoteDataSource>(
      () => GetPointTeacherRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetPointStudentRemoteDataSource>(
      () => GetPointStudentRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<GetAllStudentRemoteDataSource>(
      () => GetAllStudentRemoteDataSourceImpl(client: sl()));

  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
