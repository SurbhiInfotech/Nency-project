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
       required this.gid,
       required this.sid,
       required this.gdegree,
       required this.specialization,
       required this.yearcomplete,
       required this.cgpi,
       required this.percentage,
       required this.gclass,
       required this.gcollegename,
       required this.gcollegeadd,
       required this.gcollegecity,
       required this.gcollegepincode,
       required this.guniversity,
       required this.ganygapp,
       required this.ggapyear,
    });

    String gid;
    String sid;
    String gdegree;
    String specialization;
    String yearcomplete;
    String cgpi;
    String percentage;
    String gclass;
    String gcollegename;
    String gcollegeadd;
    String gcollegecity;
    String gcollegepincode;
    String guniversity;
    String ganygapp;
    String ggapyear;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        gid: json["gid"],
        sid: json["sid"],
        gdegree: json["gdegree"],
        specialization: json["specialization"],
        yearcomplete: json["yearcomplete"],
        cgpi: json["cgpi"],
        percentage: json["percentage"],
        gclass: json["gclass"],
        gcollegename: json["gcollegename"],
        gcollegeadd: json["gcollegeadd"],
        gcollegecity: json["gcollegecity"],
        gcollegepincode: json["gcollegepincode"],
        guniversity: json["guniversity"],
        ganygapp: json["ganygapp"],
        ggapyear: json["ggapyear"],
    );

    Map<String, dynamic> toJson() => {
        "gid": gid,
        "sid": sid,
        "gdegree": gdegree,
        "specialization": specialization,
        "yearcomplete": yearcomplete,
        "cgpi": cgpi,
        "percentage": percentage,
        "gclass": gclass,
        "gcollegename": gcollegename,
        "gcollegeadd": gcollegeadd,
        "gcollegecity": gcollegecity,
        "gcollegepincode": gcollegepincode,
        "guniversity": guniversity,
        "ganygapp": ganygapp,
        "ggapyear": ggapyear,
    };
}
Student? graduationobj;
Future<Student?> getgraduation(String sid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=getgraduation&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    graduationobj=studentFromJson(res.body);
    inspect(graduationobj);
    return graduationobj;
    //inspect(userobj);
  }
}