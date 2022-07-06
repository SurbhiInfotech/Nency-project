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
      required  this.student,
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
       required this.twid,
       required this.sid,
       required this.twepassingyear,
       required this.twecgpi,
       required this.twepercentage,
       required this.tweclass,
       required this.twespecialization,
       required this.tweschoolname,
       required this.tweschooladd,
       required this.tweschoolcity,
       required this.tweschoolpincode,
       required this.tweboard,
      required  this.tweanygap,
       required this.twegapyear,
    });

    String twid;
    String sid;
    String twepassingyear;
    String twecgpi;
    String twepercentage;
    String tweclass;
    String twespecialization;
    String tweschoolname;
    String tweschooladd;
    String tweschoolcity;
    String tweschoolpincode;
    String tweboard;
    String tweanygap;
    String twegapyear;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        twid: json["twid"],
        sid: json["sid"],
        twepassingyear: json["twepassingyear"],
        twecgpi: json["twecgpi"],
        twepercentage: json["twepercentage"],
        tweclass: json["tweclass"],
        twespecialization: json["twespecialization"],
        tweschoolname: json["tweschoolname"],
        tweschooladd: json["tweschooladd"],
        tweschoolcity: json["tweschoolcity"],
        tweschoolpincode: json["tweschoolpincode"],
        tweboard: json["tweboard"],
        tweanygap: json["tweanygap"],
        twegapyear: json["twegapyear"],
    );

    Map<String, dynamic> toJson() => {
        "twid": twid,
        "sid": sid,
        "twepassingyear": twepassingyear,
        "twecgpi": twecgpi,
        "twepercentage": twepercentage,
        "tweclass": tweclass,
        "twespecialization": twespecialization,
        "tweschoolname": tweschoolname,
        "tweschooladd": tweschooladd,
        "tweschoolcity": tweschoolcity,
        "tweschoolpincode": tweschoolpincode,
        "tweboard": tweboard,
        "tweanygap": tweanygap,
        "twegapyear": twegapyear,
    };
}
Student? twelveobj;
//var sid=userobj1!.student[0].sid;
Future<Student?> gettwelvedetails(String sid) async
{
  inspect("in");
  var sid=userobj!.student[0].sid;
  inspect(sid);
  String urls=url+"?what=gettwelvedetails&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  //inspect(res);
  if(res.statusCode==200)
  {
    twelveobj=studentFromJson(res.body);
    //inspect(twelveobj);
    return twelveobj;
    //inspect(userobj);
  }
}
