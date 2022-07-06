import 'dart:convert';
import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:placement/cohome.dart';
//import 'package:placement/coupcdetails.dart';
import 'package:placement/option.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'dart:async' show Future;
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class File extends StatefulWidget {
  const File(String path, { Key? key }) : super(key: key);

  @override
  State<File> createState() => _FileState();

  

  /*Future<File> writeCounter(int counter) async {
  //  final file = await _localFile;

    // Write the file
    //return file.writeAsString('$counter');
  }
    
}*/}

class _FileState extends State<File> {
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

            //final file = result.files.first;
            PlatformFile file = result.files.first;
            //inspect(file.path);
            _asyncFileUpload(file);
            //openFile(file);
            setState(() {
              var file_field=file;
              //inspect(file_field);
            });
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

_asyncFileUpload(PlatformFile file) async{
   //create multipart request for POST or PATCH method
   var request = http.MultipartRequest("POST", Uri.parse("https://codealphainfotech.com/luthara/lutharaapi.php?what=importFile"));
   //add text fields
   //request.fields["text_field"] = text;
   //create multipart using filepath, string or bytes
   var pic = await http.MultipartFile.fromPath("file_field", file.path.toString());
   //add multipart to request
   request.files.add(pic);
   var response = await request.send();

   //Get the response from the server
   var responseData = await response.stream.toBytes();
   var responseString = String.fromCharCodes(responseData);
   inspect(responseString);
}