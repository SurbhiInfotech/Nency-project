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
      required  this.wid,
       required this.sid,
       required this.totalworkexp,
       required this.lastsalary,
      required  this.firstorgname,
       required this.firstdesignation,
       required this.firstduration,
       required this.secorgname,
      required  this.secdesignation,
      required  this.secduration,
    });

    String wid;
    String sid;
    String totalworkexp;
    String lastsalary;
    String firstorgname;
    String firstdesignation;
    String firstduration;
    String secorgname;
    String secdesignation;
    String secduration;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        wid: json["wid"],
        sid: json["sid"],
        totalworkexp: json["totalworkexp"],
        lastsalary: json["lastsalary"],
        firstorgname: json["firstorgname"],
        firstdesignation: json["firstdesignation"],
        firstduration: json["firstduration"],
        secorgname: json["secorgname"],
        secdesignation: json["secdesignation"],
        secduration: json["secduration"],
    );

    Map<String, dynamic> toJson() => {
        "wid": wid,
        "sid": sid,
        "totalworkexp": totalworkexp,
        "lastsalary": lastsalary,
        "firstorgname": firstorgname,
        "firstdesignation": firstdesignation,
        "firstduration": firstduration,
        "secorgname": secorgname,
        "secdesignation": secdesignation,
        "secduration": secduration,
    };
}
Student? workexpobj;
//var sid=userobj1!.student[0].sid;
Future<Student?> getworkexp(String sid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=getworkexp&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    workexpobj=studentFromJson(res.body);
    //inspect(twelveobj);
    return workexpobj;
    //inspect(userobj);
  }
}
