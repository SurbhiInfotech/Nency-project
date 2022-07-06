

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';

import 'package:placement/studentapi.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/viewtendetails.dart';
class Edittendetails extends StatefulWidget {
  const Edittendetails({ Key? key }) : super(key: key);

  @override
  _EdittendetailsState createState() => _EdittendetailsState();
}
int? _value;
class _EdittendetailsState extends State<Edittendetails> {
  TextEditingController  tpassingyear= TextEditingController(text: userobj2!.student[0].tpassingyear);
  TextEditingController  tcgpi= TextEditingController(text: userobj2!.student[0].tcgpi);
  TextEditingController  tpercentage= TextEditingController(text: userobj2!.student[0].tpercentage);
  TextEditingController  tclass= TextEditingController(text: userobj2!.student[0].tclass);
TextEditingController tspecialization = TextEditingController(text: userobj2!.student[0].tspecialization);
TextEditingController tschoolname = TextEditingController(text: userobj2!.student[0].tschoolname);
TextEditingController tschooladd = TextEditingController(text: userobj2!.student[0].tschooladd);
TextEditingController tschoolcity = TextEditingController(text: userobj2!.student[0].tschoolcity);
TextEditingController tschoolpincode = TextEditingController(text: userobj2!.student[0].tschoolpincode);
TextEditingController tboard = TextEditingController(text: userobj2!.student[0].tboard);
TextEditingController tanygap = TextEditingController(text: userobj2!.student[0].tanygap);
TextEditingController tgapyear = TextEditingController(text: userobj2!.student[0].tgapyear);


String? primaryerror;
int view=0;
void initState() {
    // TODO: implement initState
    super.initState();
  
    gettendetail();
  }

  gettendetail() async
  {
   // inspect("krishna");
   // userobj2= await gettendetails("1");
    //inspect(userobj2);
    setState(() {
      view=1;
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student 10th Details",style: TextStyle(color: Colors.black),),
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
                              controller: tpassingyear,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Passing year',
                                  hintText: 'Enter Passing year'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tcgpi,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CGPI',
                                  hintText: 'Enter CGPI'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tpercentage,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Percentage',
                                  hintText: 'Enter Percentage'),
                              ),
                          ),
                          Container(
                            child: TextFormField(
                              controller: tclass,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '10th class',
                                  hintText: 'Enter class'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tspecialization,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'specialzation',
                                  hintText: 'Enter specialzation'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tschoolname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'School Name',
                                  hintText: 'Enter School Name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tschooladd,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '10th School Address',
                                  hintText: 'Enter School Address'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tschoolcity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'School City',
                                  hintText: 'Enter School City'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tschoolpincode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'School Pincode',
                                  hintText: 'Enter school Pincode'),
                              ),
                          ),
                          
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tboard,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Board',
                                  hintText: 'Enter board'),
                              ),
                          ),
                          
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tanygap,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Education Gap',
                                  hintText: 'Enter education gap'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: tgapyear,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Gap Year',
                                  hintText: 'Enter gap'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             //inspect(userobj!.student);
                                             var sid=userobj2!.student[0].sid;
                                             inspect("sid:"+sid);
                                             studedit10details(sid,tpassingyear.text,tcgpi.text,tpercentage.text,tclass.text,tspecialization.text,tschoolname.text,tschooladd.text,tschoolcity.text,tschoolpincode.text,tboard.text,tanygap.text,tgapyear.text);
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudViewTenDetails()));
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

// var eid=userobj!.student[0].eid.toString();
 
    Future studedit10details(String sid,String tpassingyear,String tcgpi,String tpercentage,String tclass,String tspecialization,String tschoolname,String tschooladd,String tschoolcity,String tschoolpincode,String tboard,String tanygap,String tgapyear) async {
     // inspect("sid"+sid);
  String purl = url+"?what=edit10details&sid=${sid}&tpassingyear=${tpassingyear}&tcgpi=${tcgpi}&tpercentage=${tpercentage}&tclass=${tclass}&tspecialization=${tspecialization}&tschoolname=${tschoolname}&tschooladd=${tschooladd}&tschoolcity=${tschoolcity}&tschoolpincode=${tschoolpincode}&tboard=${tboard}&tanygap=${tanygap}&tgapyear=${tgapyear}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }

  }
