import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/coupstudentextraachievement.dart';
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
import 'package:http/http.dart' as http;

class UpStudSumInternD extends StatefulWidget {
  const UpStudSumInternD({ Key? key }) : super(key: key);

  @override
  _UpStudSumInternDState createState() => _UpStudSumInternDState();
}

class _UpStudSumInternDState extends State<UpStudSumInternD> {
  TextEditingController  siptitle= TextEditingController();
  TextEditingController  sipcompany= TextEditingController();
  TextEditingController  sipcity= TextEditingController();
  TextEditingController  sippincode= TextEditingController();
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
          title: Text("Student Summer Internship Details",style: TextStyle(color: Colors.black),),
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
                            child: TextFormField(
                              controller: siptitle,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Summer Internship Title',
                                  hintText: 'Enter summer internship title'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: sipcompany,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Company Name',
                                  hintText: 'Enter company name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: sipcity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Company City',
                                  hintText: 'Enter company City'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: sippincode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Company Pincode',
                                  hintText: 'Enter company Pincode'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                              var sid=userobj!.student[0].sid;
                                              
                                              inspect(sid);
                                             
                                             internship(sid,siptitle.text,sipcompany.text,sipcity.text,sippincode.text);
                                            
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStuentExtraAchive()));
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
  Future internship(String sid,String siptitle,String sipcompany,String sipcity,String sippincode) async {
  String purl = url+"?what=studinternship&sid=${sid}&siptitle=${siptitle}&sipcompany=${sipcompany}&sipcity=${sipcity}&sippincode=${sippincode}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }
}