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
      required  this.applyid,
      required  this.hid,
      required  this.eid,
      required  this.interview,
      required  this.name,
      required  this.cname,
    });

    String applyid;
    String hid;
    String eid;
    String interview;
    String name;
    String cname;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        applyid: json["applyid"],
        hid: json["hid"],
        eid: json["eid"],
        interview: json["interview"],
        name: json["name"],
        cname: json["cname"],
    );

    Map<String, dynamic> toJson() => {
        "applyid": applyid,
        "hid": hid,
        "eid": eid,
        "interview": interview,
        "name": name,
        "cname": cname,
    };
}
Student? applyobj;

Future<Student?> getdataapply(String eid) async
{
 // getstudentdetails(sid)
  var eid=applyobj!.student[0].eid;
  inspect("eid:"+eid);
  String urls=url+"?what=getstudenteid&eid=${eid}";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
    applyobj=studentFromJson(res.body);
    return applyobj;
   // inspect(userobj);
  }
}
