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
        required this.eid,
        required this.sid,
       required this.surname,
       required this.name,
       required this.fname,
       required this.gname,
       required this.gender,
       required this.category,
       required this.prino,
       required this.alterno,
       required this.parentno,
       required this.dob,
       required this.langeng,
       required this.langhindi,
       required this.langguj,
       required this.langmarathi,
       required this.langother,
       required this.preadd,
       required this.precity,
       required this.prepincode,
       required this.prestate,
       required this.peradd,
       required this.percity,
       required this.perpincode,
       required this.perstate,
       required this.pancardno,
       required this.adharno,
       required this.dlicenceno,
       required this.bgroup,
    });

    String eid;
    String sid;
    String surname;
    String name;
    String fname;
    String gname;
    String gender;
    String category;
    String prino;
    String alterno;
    String parentno;
    String dob;
    String langeng;
    String langhindi;
    String langguj;
    String langmarathi;
    String langother;
    String preadd;
    String precity;
    String prepincode;
    String prestate;
    String peradd;
    String percity;
    String perpincode;
    String perstate;
    String pancardno;
    String adharno;
    String dlicenceno;
    String bgroup;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        eid: json["eid"],
        sid: json["sid"],
        surname: json["surname"],
        name: json["name"],
        fname: json["fname"],
        gname: json["gname"],
        gender: json["gender"],
        category: json["category"],
        prino: json["prino"],
        alterno: json["alterno"],
        parentno: json["parentno"],
        dob: json["dob"],
        langeng: json["langeng"],
        langhindi: json["langhindi"],
        langguj: json["langguj"],
        langmarathi: json["langmarathi"],
        langother: json["langother"],
        preadd: json["preadd"],
        precity: json["precity"],
        prepincode: json["prepincode"],
        prestate: json["prestate"],
        peradd: json["peradd"],
        percity: json["percity"],
        perpincode: json["perpincode"],
        perstate: json["perstate"],
        pancardno: json["pancardno"],
        adharno: json["adharno"],
        dlicenceno: json["dlicenceno"],
        bgroup: json["bgroup"],
    );

    Map<String, dynamic> toJson() => {
        "eid": eid,
        "sid": sid,
        "surname": surname,
        "name": name,
        "fname": fname,
        "gname": gname,
        "gender": gender,
        "category": category,
        "prino": prino,
        "alterno": alterno,
        "parentno": parentno,
        "dob": dob,
        "langeng": langeng,
        "langhindi": langhindi,
        "langguj": langguj,
        "langmarathi": langmarathi,
        "langother": langother,
        "preadd": preadd,
        "precity": precity,
        "prepincode": prepincode,
        "prestate": prestate,
        "peradd": peradd,
        "percity": percity,
        "perpincode": perpincode,
        "perstate": perstate,
        "pancardno": pancardno,
        "adharno": adharno,
        "dlicenceno": dlicenceno,
        "bgroup": bgroup,
    };
}

Student? userobj1;

Future<Student?> getstudentdetails(String sid) async
{
  //inspect('hello');
  var sid=userobj!.student[0].sid;
  //inspect("sid:"+userobj!.student[0].sid);
  String urls=url+"?what=getstudentprofile&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
    userobj1=studentFromJson(res.body);
   // inspect(userobj1);
    return userobj1;
    //inspect(userobj1);
  }

}
Student? studentobj;
Future<Student?> getstuddetails() async
{
  inspect("in stud");
  //var sid=userobj!.student[0].sid;
  //inspect("sid in:"+sid);
  //inspect('hello');
  //var sid=userobj!.student[0].sid;
  //inspect("sid:"+userobj!.student[0].sid);
  String urls=url+"?what=getstuddetails";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
   
    studentobj=studentFromJson(res.body);
  //inspect(studentobj);
    return studentobj;
    //inspect(userobj1);
  }
}


