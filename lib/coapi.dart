import 'dart:convert';
import 'package:http/http.dart' as http;
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
        required this.cid,
        required this.email,
        required this.password,
    });

    String cid;
    String email;
    String password;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        cid: json["cid"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "cid": cid,
        "email": email,
        "password": password,
    };
}

Student? userobj;

Future<Student?> getcoodinatorlogin(String email,String password) async
{
  String urls=url+"?what=getcoodinatorlogin&email=${email}&password=${password}";
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