// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';
import 'package:placement/main.dart';
import 'package:http/http.dart' as http;
// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);


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
       required this.hid,
      required  this.cid,
      required  this.desioffer,
      required  this.roles,
      required  this.othrequirement,
      required  this.department,
      required  this.sector,
      required  this.location,
      required  this.jdate,
      required  this.status,
      required  this.cname,
      required  this.about,
      required  this.contactno,
    });

    String hid;
    String cid;
    String desioffer;
    String roles;
    String othrequirement;
    String department;
    String sector;
    String location;
    String jdate;
    String status;
    String cname;
    String about;
    String contactno;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        hid: json["hid"],
        cid: json["cid"],
        desioffer: json["desioffer"],
        roles: json["roles"],
        othrequirement: json["othrequirement"],
        department: json["department"],
        sector: json["sector"],
        location: json["location"],
        jdate: json["jdate"],
        status: json["status"],
        cname: json["cname"],
        about: json["about"],
        contactno: json["contactno"],
    );

    Map<String, dynamic> toJson() => {
        "hid": hid,
        "cid": cid,
        "desioffer": desioffer,
        "roles": roles,
        "othrequirement": othrequirement,
        "department": department,
        "sector": sector,
        "location": location,
        "jdate": jdate,
        "status": status,
        "cname": cname,
        "about": about,
        "contactno": contactno,
    };
}

Student? hiringobj;

Future<Student?> gethiringdetails(String cid) async
{
  //var cid=hiringobj!.student[0].cid;
  
  inspect(cid);
  String urls=url+"?what=gethiringdetails&cid=${cid}";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
    hiringobj=studentFromJson(res.body);
    inspect(hiringobj);
    return hiringobj;
   // inspect(userobj);
  }
}
