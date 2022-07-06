// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
import 'package:placement/studregester.dart';
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
       required this.cid,
       required this.cname,
       required this.about,
       required this.contactno,
    });

    String cid;
    String cname;
    String about;
    String contactno;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        cid: json["cid"],
        cname: json["cname"],
        about: json["about"],
        contactno: json["contactno"],
    );

    Map<String, dynamic> toJson() => {
        "cid": cid,
        "cname": cname,
        "about": about,
        "contactno": contactno,
    };
   
}
Student? userobj3;
Future<Student?> getcompany() async
{
   String urls=url+"?what=getcompanyd";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
    userobj3=studentFromJson(res.body);

    return userobj3;
  }
}
Student? userobj4;
Future<Student?>  getcompanyupdate(String cid) async
{
  // Student? userobj5=userobj4;
  inspect("here in update:"+cid);
  String urls=url+"?what=getcompanyupdate&cid=$cid";
  var res= await http.get(Uri.parse(urls));

  if(res.statusCode==200)
  {
    userobj4=studentFromJson(res.body);
    inspect(userobj4);
    return userobj4;
  }
}






  

