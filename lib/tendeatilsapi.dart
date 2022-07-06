// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';

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
       required this.tid,
       required this.sid,
       required this.eid,
       required this.tpassingyear,
       required this.tcgpi,
       required this.tpercentage,
       required this.tclass,
       required this.tspecialization,
       required this.tschoolname,
       required this.tschooladd,
       required this.tschoolcity,
       required this.tschoolpincode,
       required this.tboard,
       required this.tanygap,
       required this.tgapyear,
    });

    String tid;
    String sid;
    String eid;
    String tpassingyear;
    String tcgpi;
    String tpercentage;
    String tclass;
    String tspecialization;
    String tschoolname;
    String tschooladd;
    String tschoolcity;
    String tschoolpincode;
    String tboard;
    String tanygap;
    String tgapyear;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        tid: json["tid"],
        sid: json["sid"],
        eid: json["eid"],
        tpassingyear: json["tpassingyear"],
        tcgpi: json["tcgpi"],
        tpercentage: json["tpercentage"],
        tclass: json["tclass"],
        tspecialization: json["tspecialization"],
        tschoolname: json["tschoolname"],
        tschooladd: json["tschooladd"],
        tschoolcity: json["tschoolcity"],
        tschoolpincode: json["tschoolpincode"],
        tboard: json["tboard"],
        tanygap: json["tanygap"],
        tgapyear: json["tgapyear"],
    );

    Map<String, dynamic> toJson() => {
        "tid": tid,
        "sid": sid,
        "eid": eid,
        "tpassingyear": tpassingyear,
        "tclass": tclass,
        "tspecialization": tspecialization,
        "tschoolname": tschoolname,
        "tschooladd": tschooladd,
        "tschoolcity": tschoolcity,
        "tschoolpincode": tschoolpincode,
        "tboard": tboard,
        "tanygap": tanygap,
        "tgapyear": tgapyear,
    };
}
Student? userobj2;
//var sid=userobj1!.student[0].sid;
Future<Student?> gettendetails(String eid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=gettendetails&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    userobj2=studentFromJson(res.body);
    return userobj2;
    //inspect(userobj);
  }
}
