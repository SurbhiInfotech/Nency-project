// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;



import 'dart:convert';

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
        required this.sid,
        required this.enrollno,
        required this.email,
        required this.password,
    });

    String sid;
    String enrollno;
    String email;
    String password;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        sid: json["sid"],
        enrollno: json["enrollno"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "sid": sid,
        "enrollno": enrollno,
        "email": email,
        "password": password,
    };
}
Student? userobj;

Future<Student?> getuser(String e) async
{
  String urls=url+"?what=getstudent&email=${e}";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
    userobj=studentFromJson(res.body);
    return userobj;
    inspect(userobj);
  }
}

Future<Student?> getuserlogin(String e,String p) async
{
  String urls=url+"?what=getstudentlogin&email=${e}&password=${p}";
  var res= await http.get(Uri.parse(urls));
  userobj = null;
  if(res.statusCode==200)
  {
    if(res.body == "" || res.body == null)
    {
      userobj = null;
    }
    else
    {
      userobj=studentFromJson(res.body);
    }
    
  }
  return userobj;
}
Student? getstudent;
Future<Student?> getstudentdetails() async
{
  inspect("in student details");
  String urls=url+"?what=getstudentdetails";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
     getstudent=studentFromJson(res.body);
    return getstudent;
  }
}



