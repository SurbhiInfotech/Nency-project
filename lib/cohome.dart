import 'package:flutter/material.dart';
import 'package:placement/codisplaycompany.dart';
import 'package:placement/coeditcompanydetails.dart';
import 'package:placement/colistcompany.dart';
import 'package:placement/cologin.dart';
import 'package:placement/costudentlist.dart';
import 'package:placement/coupcdetails.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/coupstudent10thdetail.dart';
import 'package:placement/coupstudent12thdetail.dart';
import 'package:placement/studentviewprofile.dart';
import 'package:placement/studregester.dart';
//import 'package:placement/file2.dart';
import 'csv_to_list.dart';
import 'package:placement/login.dart';
import 'package:placement/option.dart';
import 'package:placement/studhome.dart';
import 'package:placement/main.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CoHome extends StatefulWidget {
  const CoHome({ Key? key }) : super(key: key);



  @override
  _CoHomeState createState() => _CoHomeState();
}

List classname = [
  Displaycompany(), UpCompany(), CsvToList(),Studentlist(),Listcompany()
];

List<String> uploaddata = [
  "View Student Apply Details",
  "Upload Company Details",
  "Import Excel Sheet",
  "View Student List",
  "Update Company Details"
];
List<IconData> icons = [
  Icons.person,
  Icons.apartment,
  Icons.file_download,
  Icons.person,
  Icons.apartment,
];


class _CoHomeState extends State<CoHome> {
  int currindex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 34)),
                        Image.asset('assets/images/logo.png',height: 43,width: 100,),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(     
                              borderRadius: BorderRadius.circular(25)
                              ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Luthara",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Luthara@gmail.com",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CoHome()));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.apartment,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Upload Companies",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCompany()));
              },
            ),
           ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.share_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'View Student List',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.privacy_tip_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Update Company Details',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.file_download,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Import CSV File',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                //Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CsvToList()));
              },
            ),

            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.login_rounded,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Option()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
          title: Text("Co-Ordineter Home",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 30),
        child: Container(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 1,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 15),
            itemCount: uploaddata.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    height: 250,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Icon(
                        icons[index],
                        size: 35,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromRGBO(162, 29, 65, 1.0),
                      ),
                    ),
                    left: 10,
                    top: 10,
                  ),
                  Positioned(
                    child: Container(
                      width: 140,
                      height: 50,
                      child: Text(
                        uploaddata[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    top: 80,
                    left: 15,
                  ),
                  Positioned(
                    child: Container(
                      width: 140,
                      height: 50,
                      child: Text(
                        uploaddata[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    top: 80,
                    left: 15,
                  ),
                  Positioned(
                    child: Container(
                      width: 140,
                      height: 50,
                      child: Text(
                        uploaddata[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    top: 80,
                    left: 15,
                  ),

                  Positioned(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => classname[index],
                              ));
                        },
                        icon: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(162, 29, 65, 1.0), 
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.white,
                          ),
                        )),
                    bottom: 10,
                    left: 60,
                  )

                


                ],
              );
            },
          ),
        ),
      )
      ),
    )
    );
  }
}