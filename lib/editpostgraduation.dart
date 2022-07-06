import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement/coupstudentgraddetail.dart';
import 'package:placement/main.dart';
import 'package:placement/postgraduationapi.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/viewpostgraduation.dart';
var sid;
//var eid;
class EditStudentPostgraduation extends StatefulWidget {
  const EditStudentPostgraduation({ Key? key }) : super(key: key);

  @override
  State<EditStudentPostgraduation> createState() => _EditStudentPostgraduationState();
}

class _EditStudentPostgraduationState extends State<EditStudentPostgraduation> {
  TextEditingController mbaspecialization = TextEditingController(text: postgobj!.student[0].mbaspecialization);
TextEditingController semonemark = TextEditingController(text: postgobj!.student[0].semonemark);
TextEditingController semteomark = TextEditingController(text: postgobj!.student[0].semteomark);
TextEditingController semthreemark = TextEditingController(text: postgobj!.student[0].semthreemark);
//String? primaryerror;
  int view=0;

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
    getuserdata();
  }

  getuserdata() async
  {
   
   
  /*getstuddetails();
    eid=studentobj!.student[0].eid;
    inspect("eid:"+eid);*/

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
          title: Text("Student Post Graduation Details",style: TextStyle(color: Colors.black),),
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
                              controller: mbaspecialization,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'MBA Specialization',
                                  hintText: 'Enter mba specialization'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: semonemark,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Semester One Marks',
                                  hintText: 'Enter semester one marks'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: semteomark,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Semester Two Marks',
                                  hintText: 'Enter semester two marks'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: semthreemark,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Semester Three Marks',
                                  hintText: 'Enter semester three marks'),
                              ),
                          ),

                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             // geteid();
                                             sid=userobj!.student[0].sid;
                                             inspect("sid:"+sid);
                                             pg(sid,mbaspecialization.text,semonemark.text,semteomark.text,semthreemark.text);


                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudViewPostgraduation()));
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
  Future pg(String sid,String mbaspecialization,String semonemark,String semteomark,String semthreemark) async {
  String purl = url+"?what=editpostgraduation&sid=${sid}&mbaspecialization=${mbaspecialization}&semonemark=${semonemark}&semteomark=${semteomark}&semthreemark=${semthreemark}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
  return pres.body;
}
geteid()async{
    getstuddetails();
    eid=studentobj!.student[0].eid;
    inspect(eid);
  }
}
