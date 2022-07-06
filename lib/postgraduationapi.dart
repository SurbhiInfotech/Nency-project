// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'dart:developer';
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
       required this.pgid,
       required this.sid,
       required this.mbaspecialization,
       required this.semonemark,
       required this.semteomark,
       required this.semthreemark,
    });

    String pgid;
    String sid;
    String mbaspecialization;
    String semonemark;
    String semteomark;
    String semthreemark;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        pgid: json["pgid"],
        sid: json["sid"],
        mbaspecialization: json["mbaspecialization"],
        semonemark: json["semonemark"],
        semteomark: json["semteomark"],
        semthreemark: json["semthreemark"],
    );

    Map<String, dynamic> toJson() => {
        "pgid": pgid,
        "sid": sid,
        "mbaspecialization": mbaspecialization,
        "semonemark": semonemark,
        "semteomark": semteomark,
        "semthreemark": semthreemark,
    };
}
Student? postgobj;
Future<Student?> getpostgraduation(String sid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=getpostgraduation&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    postgobj=studentFromJson(res.body);
   // inspect(graduationobj);
    return postgobj;
    //inspect(userobj);
  }
}