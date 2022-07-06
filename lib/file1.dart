import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:placement/cohome.dart';
import 'package:placement/coupcdetails.dart';
import 'package:placement/option.dart';
import 'package:csv/csv.dart';
class File extends StatefulWidget {
  const File({ Key? key }) : super(key: key);

  @override
  State<File> createState() => _FileState();
}

class _FileState extends State<File> {
  //File csvfile=new File("Book1.csv");

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
          title: Text("File Uploading",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CoHome()));
          },
        ),
      ),
      body: 
        Container(
          constraints: BoxConstraints(maxWidth:400),
          padding: EdgeInsets.all(32),
          alignment: Alignment.center,
          child: ElevatedButton(onPressed: () async {
            final result = await FilePicker.platform.pickFiles();
            if (result == null) return;

            final file = result.files.first;
            openFile(file);
          }, 
          child: Text("Pick File",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                    )
                                    ),
        )
      )
    );
  }
  
}




void openFile(PlatformFile file) {
  OpenFile.open(file.path);
}