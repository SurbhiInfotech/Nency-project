/*import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/coupstudorgdetails.dart';
import 'package:placement/coupstudsuminterndetails.dart';

enum SingingCharacter { Yes , No }

class UpStudWorkExpD extends StatefulWidget {
  const UpStudWorkExpD({ Key? key }) : super(key: key);

  @override
  _UpStudWorkExpDState createState() => _UpStudWorkExpDState();
}

class _UpStudWorkExpDState extends State<UpStudWorkExpD> {
  SingingCharacter? _characterss = SingingCharacter.Yes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Student Work Experience Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudent()));
          },
        ),
      ),
      body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.2)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        children: [
                          Container(
                              child: const Text("Do you have any work experience ?",style: TextStyle(fontSize: 20),),
                            ),
                            ListTile(
                            title: const Text('Yes'),
                            leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Yes,
                            groupValue: _characterss,
                            onChanged: (SingingCharacter? value) {
                            setState(() {
                                _characterss = value;
                              });
                            },
                          ),
                          ),
                          ListTile(
                              title: const Text('No'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.No,
                                groupValue: _characterss,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _characterss = value;
                                  });
                                },
                              ),
                            ),

                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudSumInternD()));
                                           }, 
                                           child: 
                                           Text("Save",style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                            ),),
                                           style: OutlinedButton.styleFrom(
                                             padding: EdgeInsets.only(left:120,right: 120,top: 15,bottom: 15),
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           ),
                                SizedBox(height: 15,),
                        ],
                      ),
                ),
                    ],
                  ),
          ),
              ],
            ),
        )
      );
  }
}*/

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement/coupstudsuminterndetails.dart';
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/viewworkexp.dart';
import 'package:placement/workexpapi.dart';
var sid;
class EditStudentWorkExp extends StatefulWidget {
  const EditStudentWorkExp({ Key? key }) : super(key: key);

  @override
  State<EditStudentWorkExp> createState() => _EditStudentWorkExpState();
}

class _EditStudentWorkExpState extends State<EditStudentWorkExp> {
  TextEditingController  totalworkexp= TextEditingController(text: workexpobj!.student[0].totalworkexp);
  TextEditingController  lastsalary= TextEditingController(text: workexpobj!.student[0].lastsalary);
  TextEditingController  firstorgname= TextEditingController(text: workexpobj!.student[0].firstorgname);
  TextEditingController  firstdesignation= TextEditingController(text: workexpobj!.student[0].firstdesignation);
TextEditingController firstduration = TextEditingController(text: workexpobj!.student[0].firstduration);
TextEditingController secorgname = TextEditingController(text: workexpobj!.student[0].secorgname);
TextEditingController secdesignation = TextEditingController(text: workexpobj!.student[0].secdesignation);
TextEditingController secduration = TextEditingController(text: workexpobj!.student[0].secduration);

int view=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
    getuserdata();
  }

  getuserdata() async
  {
   //// setString();
  // getSring();
   
    //userobj= await getuser(eid);
    setState(() {
      view=1;

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Work Experience Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudent()));
          },
        ),
      ),
      body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.2)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: totalworkexp,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Total Work Experience',
                                  hintText: 'Enter total work experience'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: lastsalary,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Salary',
                                  hintText: 'Enter last salary'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: firstorgname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Organization Name',
                                  hintText: 'Enter first organization name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: firstdesignation,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Designation',
                                  hintText: 'Enter first designation'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: firstduration,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Duration',
                                  hintText: 'Enter first duration'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: secorgname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Second Organization Name',
                                  hintText: 'Enter second organization name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: secdesignation,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Second Designation',
                                  hintText: 'Enter second designation'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: secduration,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Second Duration',
                                  hintText: 'Enter second duration'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             var sid=userobj!.student[0].sid;
                                             
                                              inspect(sid);
                                              
                                             workexp(sid,totalworkexp.text,lastsalary.text,firstorgname.text,firstdesignation.text,firstduration.text,secorgname.text,secdesignation.text,secduration.text);
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudViewWorkexp()));
                                           }, 
                                           child: 
                                           Text("Save",style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                            ),),
                                           style: OutlinedButton.styleFrom(
                                             padding: EdgeInsets.only(left:120,right: 120,top: 15,bottom: 15),
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           ),
                                SizedBox(height: 15,),
                        ],
                      ),
                ),
                    ],
                  ),
          ),
              ],
            ),
        )
      )
    );
  }
  
    Future workexp(String sid,String totalworkexp,String lastsalary,String firstorgname,String firstdesignation,String firstduration,String secorgname,String secdesignation,String secduration) async {
  String purl = url+"?what=editworkexp&sid=${sid}&totalworkexp=${totalworkexp}&lastsalary=${lastsalary}&firstorgname=${firstorgname}&firstdesignation=${firstdesignation}&firstduration=${firstduration}&secorgname=${secorgname}&secdesignation=${secdesignation}&secduration=${secduration}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }
}