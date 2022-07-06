import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';

//import 'main.dart';


Student studprofileFromJson(String str) => Student.fromJson(json.decode(str));

String studprofileToJson(Student data) => json.encode(data.toJson());

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
       required this.enrolno,
       required this.surname,
       required this.name,
       required this.fathername,
       required this.grandfathername,
       required this.gender,
       required this.castcate,
       required this.primono,
       required this.secmono,
       required this.permono,
       required this.dob,
       required this.rgidate,
       required this.bgroup,
       required this.inteshift,
       required this.eactivity,
       required this.achive,
       required this.message,
       required this.password,
       required this.email,
    });

    String eid;
    String enrolno;
    String surname;
    String name;
    String fathername;
    String grandfathername;
    String gender;
    String castcate;
    String primono;
    String secmono;
    String permono;
    String dob;
    String rgidate;
    String bgroup;
    String inteshift;
    String eactivity;
    String achive;
    String message;
    String password;
    String email;

    factory StudentElement.fromJson(Map<String, dynamic> json) => StudentElement(
        eid: json["eid"],
        enrolno: json["enrolno"],
        surname: json["surname"],
        name: json["name"],
        fathername: json["fathername"],
        grandfathername: json["grandfathername"],
        gender: json["gender"],
        castcate: json["castcate"],
        primono: json["primono"],
        secmono: json["secmono"],
        permono: json["permono"],
        dob: json["dob"],
        rgidate: json["rgidate"],
        bgroup: json["bgroup"],
        inteshift: json["inteshift"],
        eactivity: json["eactivity"],
        achive: json["achive"],
        message: json["message"],
        password: json["password"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "eid": eid,
        "enrolno": enrolno,
        "surname": surname,
        "name": name,
        "fathername": fathername,
        "grandfathername": grandfathername,
        "gender": gender,
        "castcate": castcate,
        "primono": primono,
        "secmono": secmono,
        "permono": permono,
        "dob": dob,
        "rgidate": rgidate,
        "bgroup": bgroup,
        "inteshift": inteshift,
        "eactivity": eactivity,
        "achive": achive,
        "message": message,
        "password": password,
        "email": email,
    };
}


Student? userobj;

Future<Student?> getuser(String e) async
{
  String urls=url+"?what=getstudentprofile&email=${e}";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
    userobj=studprofileFromJson(res.body);
    return userobj;
  }
}


