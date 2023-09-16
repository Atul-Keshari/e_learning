class GetDashboardResponse {
  int? status;
  bool? success;
  String? message;
  GetDashboardData? data;

  GetDashboardResponse({this.status, this.success, this.message, this.data});

  GetDashboardResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? GetDashboardData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class GetDashboardData {
  int? totalLecture;
  int? totalCourse;
  int? totalExercise;
  int? totalAnswer;
  int? totalStudent;
  int? totalTeacher;

  GetDashboardData(
      {this.totalLecture,
      this.totalCourse,
      this.totalExercise,
      this.totalAnswer,
      this.totalStudent,
      this.totalTeacher});

  GetDashboardData.fromJson(Map<String, dynamic> json) {
    totalLecture = json['totalLecture'];
    totalCourse = json['totalCourse'];
    totalExercise = json['totalExercise'];
    totalAnswer = json['totalAnswer'];
    totalStudent = json['totalStudent'];
    totalTeacher = json['totalTeacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalLecture'] = totalLecture;
    data['totalCourse'] = totalCourse;
    data['totalExercise'] = totalExercise;
    data['totalAnswer'] = totalAnswer;
    data['totalStudent'] = totalStudent;
    data['totalTeacher'] = totalTeacher;
    return data;
  }
}
