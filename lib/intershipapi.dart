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
       required this.itid,
       required this.sid,
       required this.siptitle,
       required this.sipcompany,
       required this.sipcity,
       required this.sippincode,
    });

    String itid;
    String sid;
    String siptitle;
    String sipcompany;
    String sipcity;
    String sippincode;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        itid: json["itid"],
        sid: json["sid"],
        siptitle: json["siptitle"],
        sipcompany: json["sipcompany"],
        sipcity: json["sipcity"],
        sippincode: json["sippincode"],
    );

    Map<String, dynamic> toJson() => {
        "itid": itid,
        "sid": sid,
        "siptitle": siptitle,
        "sipcompany": sipcompany,
        "sipcity": sipcity,
        "sippincode": sippincode,
    };
}
Student? internobj;
//var sid=userobj1!.student[0].sid;
Future<Student?> getinternship(String sid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=getinternship&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    internobj=studentFromJson(res.body);
    //inspect(twelveobj);
    return internobj;
    //inspect(userobj);
  }
}
