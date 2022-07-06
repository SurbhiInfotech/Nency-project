import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:http/http.dart' as http;

import 'package:placement/coupstudent10thdetail.dart';
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/twelvedetailsapi.dart';
import 'package:placement/viewtwelvedetails.dart';

import 'coupstudentpostgraduation.dart';

var sid;
class EditStudentTweD extends StatefulWidget {
  const EditStudentTweD({ Key? key }) : super(key: key);

  @override
  _EditStudentTweDState createState() => _EditStudentTweDState();
}

class _EditStudentTweDState extends State<EditStudentTweD> {
  TextEditingController  twepassingyear= TextEditingController(text: twelveobj!.student[0].twepassingyear);
  TextEditingController  twecgpi= TextEditingController(text: twelveobj!.student[0].twecgpi);
  TextEditingController  twepercentage= TextEditingController(text: twelveobj!.student[0].twepercentage);
  TextEditingController  tweclass= TextEditingController(text: twelveobj!.student[0].tweclass);
TextEditingController twespecialization = TextEditingController(text: twelveobj!.student[0].twespecialization);
TextEditingController tweschoolname = TextEditingController(text: twelveobj!.student[0].tweschoolname);
TextEditingController tweschooladd = TextEditingController(text: twelveobj!.student[0].tweschooladd);
TextEditingController tweschoolcity = TextEditingController(text: twelveobj!.student[0].tweschoolcity);
TextEditingController tweschoolpincode = TextEditingController(text: twelveobj!.student[0].tweschoolpincode);
TextEditingController tweboard = TextEditingController(text: twelveobj!.student[0].tweboard);
TextEditingController tweanygap = TextEditingController(text: twelveobj!.student[0].tweanygap);
TextEditingController twegapyear = TextEditingController(text: twelveobj!.student[0].twegapyear);
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
          title: Text("Student 12th Details",style: TextStyle(color: Colors.black),),
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
                              controller: twepassingyear,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Passing Year',
                                  hintText: 'Passing Year'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: twecgpi,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CGPI',
                                  hintText: 'CGPI'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: twepercentage,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Percentage',
                                  hintText: 'Percentage'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tweclass,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Class',
                                  hintText: 'Class'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: twespecialization,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'specialization',
                                  hintText: 'specialization'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tweschoolname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'School Name',
                                  hintText: 'Enter School Name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tweschooladd,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '12th School Address',
                                  hintText: 'Enter School Address'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tweschoolcity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'School City ',
                                  hintText: 'Enter School City'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tweschoolpincode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'School Pincode',
                                  hintText: 'Enter school Pincode'),
                              ),
                          ),
                          
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tweboard,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Board',
                                  hintText: 'Enter board'),
                              ),
                          ),
                          
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tweanygap,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Education Gap',
                                  hintText: 'Enter education gap YES/NO'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: twegapyear,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Gap Year',
                                  hintText: 'Enter no gap'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             sid=userobj!.student[0].sid;
                                             
                                              inspect(sid);
                                             
                                             studedit12details(sid,twepassingyear.text,twecgpi.text,twepercentage.text,tweclass.text,twespecialization.text,tweschoolname.text,tweschooladd.text,tweschoolcity.text,tweschoolpincode.text,tweboard.text,tweanygap.text,twegapyear.text);
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>StudViewTwelveDetails()));
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
    Future studedit12details(String sid,String twepassingyear,String twecgpi,String twepercentage,String tweclass,String twespecialization,String tweschoolname,String tweschooladd,String tweschoolcity,String tweschoolpincode,String tweboard,String tweanygap,String twegapyear) async {
  String purl = url+"?what=editstudent12details&sid=${sid}&twepassingyear=${twepassingyear}&twecgpi=${twecgpi}&twepercentage=${twepercentage}&tweclass=${tweclass}&twespecialization=${twespecialization}&tweschoolname=${tweschoolname}&tweschooladd=${tweschooladd}&tweschoolcity=${tweschoolcity}&tweschoolpincode=${tweschoolpincode}&tweboard=${tweboard}&tweanygap=${tweanygap}&twegapyear=${twegapyear}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);

  }
}