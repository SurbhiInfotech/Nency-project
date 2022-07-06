import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
//import 'package:flutter_file_picker/file_list.dart';
import 'package:open_file/open_file.dart';
class CsvToList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CsvToListState();
  }

}
class CsvToListState extends State<CsvToList>{
  late List<List<dynamic>> employeeData;
   
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PlatformFile>? _paths;
  String? _extension="csv";
  FileType _pickingType = FileType.custom;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeData  = List<List<dynamic>>.empty(growable: true);
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
          title: Text("Import File",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
      ),
        body: SingleChildScrollView(
          child: Column(
            
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                decoration: BoxDecoration(
                                  color: Color.fromRGBO(162, 29, 65, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                height: 30,
                child: TextButton(
                  child: Text("CSV To List Button",style: TextStyle(color: Colors.white,),),
                  onPressed: _openFileExplorer,
                ),
                
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: employeeData.length,
                itemBuilder: (context,index){
                  if(index>0)
                  {
                    var eid = employeeData[index][0].toString();
                    var email = employeeData[index][1].toString();
                    var password = employeeData[index][2].toString();
                    insertcsv(eid, email, password);
                  }
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(employeeData[index][0].toString()),
                          Text(employeeData[index][1].toString()),
                          Text(employeeData[index][2].toString()),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
        )
      ),
    );
  }
  openFile(filepath) async
  {
    //File f = new File(filepath);
    print("CSV to List Here");
    //final input = f.openRead();
    //final fields = await input.transform(utf8.decoder).transform(new CsvToListConverter()).toList();
    //final fields = await rootBundle.loadString(filepath);
    //print(fields);
    setState(() {
      //employeeData=fields;
    });

    final _rawData = await rootBundle.loadString(filepath);
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      employeeData = _listData;
    });
  }

  
  void _openFileExplorer() async {

    /* try {

      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    } */
    if (!mounted) return;
    setState(() {
      //openFile(_paths![0].path);
      openFile('assets/images/student.csv');
      //print('Hello');
      //print(_paths);
      //print("File path ${_paths![0]}");
      //print(_paths!.first.extension);

    });
  }
}

Future insertcsv(String eid,String email,String password) async {
  String purl = url+"?what=insertcsv&eid=${eid}&email=${email}&password=${password}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
  return pres.body;
} 


