// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:placement/studentapi.dart';
import 'package:placement/main.dart';

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
       required this.aqid,
       required this.sid,
       required this.addqualification,
       required this.cmatscore,
    });

    String aqid;
    String sid;
    String addqualification;
    String cmatscore;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        aqid: json["aqid"],
        sid: json["sid"],
        addqualification: json["addqualification"],
        cmatscore: json["cmatscore"],
    );

    Map<String, dynamic> toJson() => {
        "aqid": aqid,
        "sid": sid,
        "addqualification": addqualification,
        "cmatscore": cmatscore,
    };
}
Student? addqualificationobj;
//var sid=userobj1!.student[0].sid;
Future<Student?> getadditionalqualification(String sid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=getadditionalqualification&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    addqualificationobj=studentFromJson(res.body);
    //inspect(twelveobj);
    return addqualificationobj;
    //inspect(userobj);
  }
}
