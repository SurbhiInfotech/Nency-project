import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/addqualificationapi.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/coupstudworkexpdetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/viewaddqualification.dart';
var sid;
class EditStudAddQualification extends StatefulWidget {
  const EditStudAddQualification({ Key? key }) : super(key: key);

  @override
  State<EditStudAddQualification> createState() => _EditStudAddQualificationState();
}

class _EditStudAddQualificationState extends State<EditStudAddQualification> {
  TextEditingController  addqualification= TextEditingController(text:addqualificationobj!.student[0].addqualification);
  TextEditingController  cmatscore= TextEditingController(text:addqualificationobj!.student[0].cmatscore);
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
          title: Text("Additional Qualification Details",style: TextStyle(color: Colors.black),),
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
                              controller: addqualification,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Additional Qualification',
                                  hintText: 'Enter aditional qualification'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: cmatscore,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CMAT Score',
                                  hintText: 'Enter CMAt score'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             var sid=userobj!.student[0].sid;
                                              
                                              inspect(sid);
                                             
                                             addqualication(sid,addqualification.text,cmatscore.text);
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudViewaddqualification()));
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
  Future addqualication(String sid,String addqualification,String cmatscore) async {
  String purl = url+"?what=editadditionalqualification&sid=${sid}&addqualification=${addqualification}&cmatscore=${cmatscore}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }

}