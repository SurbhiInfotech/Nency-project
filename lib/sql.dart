import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
}


Database? student;

Future<Database?> get initdatabase async {
  if (student != null) {
    return student;
  }

  student = await initDB();
  return student;
}




initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  String path = join(documentsDirectory.path,"student.db");

  return await openDatabase(path, version: 1, onOpen: (db) {
  }, onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE stud("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "fname TEXT,"
      "lname TEXT,"
      "contact TEXT,"
      "email TEXT,"
      "password TEXT"
    ")");
  });
}



Stud tablenameFromJson(String str) {
  final jsonData = json.decode(str);
  return Stud.fromMap(jsonData);
}

String tablenameToJson(Stud data) {
  final dm = data.toMap();
  return json.encode(dm);
}

class Stud{
  int id;
  String fname;
  String lname;
  String contact;
  String email;
  String password;
  static final columns =["id","fname","lname","contact","email","password"];

  Stud({
    required this.id,
    required this.fname,
    required this.lname,
    required this.contact,
    required this.email,
    required this.password
  });

  factory Stud.fromMap(Map<dynamic, dynamic> json) => Stud(
    id: json["id"],
    fname: json["fname"],
    lname: json["lname"],
    contact: json["contact"],
    email: json["email"],
    password: json["password"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "fname": fname,
    "lname": lname,
    "contact": contact,
    "email": email,
    "password": password
  };
}

List<Stud> tabledata = [];

readdata(String e,String p) async {
    final db = await initdatabase;
    List<Map> alldata = await db!.rawQuery("select * from stud where contact like '${e}' and password like '${p}'");

    alldata.forEach((data) {
      Stud finaldata= Stud.fromMap(data);
      tabledata.add(finaldata);
    });
}


