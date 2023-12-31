import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:e_learning/core/config/constants.dart';
import 'package:e_learning/core/error/exceptions.dart';
import 'package:e_learning/feature/lecture/data/models/get_info_lecture_res.dart';
import 'package:e_learning/main.dart';

http.Client? client = http.Client();

Future<bool> editLecture(
    {int? idLecture,
    String? idCourse,
    String? nameLecture,
    String? descriptionAnswer,
    List<FileUpload>? fileKeep,
    List<PlatformFile>? listFile,
    Function? success,
    Function? failure}) async {
  print(idCourse);

  ///chua chinh link api
  var uri = Uri.parse(
      '$mainUrl/lecture/EditLecture?idCourse=$idCourse&idLecture=$idLecture');
  var request = http.MultipartRequest('PUT', uri);

  for (int i = 0; i < fileKeep!.length; i++) {
    request.fields["fileKeep[$i]"] = "${fileKeep[i].filename!}";
  }

  request.headers["Accept"] = "application/json";
  request.headers["auth-token"] = "${appUser?.token}";
  request.headers["Content-Type"] = "multipart/form-data";

  request.fields["nameLecture"] = "$nameLecture";
  request.fields["idLecture"] = "$idLecture";

  if (descriptionAnswer != null) {
    request.fields["descriptionAnswer"] = "$descriptionAnswer";
  }

  request.fields["files"] = "files";
  request.fields['idCourse'] = '$idCourse';
  for (var item in listFile!) {
    var file = await http.MultipartFile.fromPath("files", item.path!);
    request.files.add(file);
  }
  // for (var item in listFile!) {
  //   var file = await http.MultipartFile.fromPath("fileKeep", item.path!);
  //   request.files.add(file);
  // }

  var response = await request.send();
  var a = await response.stream.toBytes();
  var b = String.fromCharCodes(a);
  print("${b}");
  print("${response.request}");

  if (response.statusCode == 200) {
    success!();
    return true;
  } else {
    failure!();
    throw ServerException();
  }
}
