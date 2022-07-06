// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    Student({
       required this.student,
    });

    List<StudentElement> student;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        student: List<StudentElement>.from(json["student"].map((x) => StudentElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "student": List<dynamic>.from(student.map((x) => x.toJson())),
    };
}

class StudentElement {
    StudentElement({
       required this.aid,
       required this.sid,
       required this.exactivity,
       required this.specificachieve,
       required this.message,
    });

    String aid;
    String sid;
    String exactivity;
    String specificachieve;
    String message;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        aid: json["aid"],
        sid: json["sid"],
        exactivity: json["exactivity"],
        specificachieve: json["specificachieve"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "aid": aid,
        "sid": sid,
        "exactivity": exactivity,
        "specificachieve": specificachieve,
        "message": message,
    };
}
Student? extraachiveobj;
//var sid=userobj1!.student[0].sid;
Future<Student?> getextraachievement(String sid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=getextraachievement&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    extraachiveobj=studentFromJson(res.body);
    //inspect(twelveobj);
    return extraachiveobj;
    //inspect(userobj);
  }
}
