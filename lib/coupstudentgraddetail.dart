import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/coupstudent12thdetail.dart';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
var sid;
class UpStudentGradD extends StatefulWidget {
  const UpStudentGradD({ Key? key }) : super(key: key);

  @override
  _UpStudentGradDState createState() => _UpStudentGradDState();
}

class _UpStudentGradDState extends State<UpStudentGradD> {
  TextEditingController  gdegree= TextEditingController();
  TextEditingController  specialization= TextEditingController();
  TextEditingController  yearcomplete= TextEditingController();
  TextEditingController  cgpi= TextEditingController();
TextEditingController percentage = TextEditingController();
TextEditingController gclass = TextEditingController();
TextEditingController gcollegename = TextEditingController();
TextEditingController gcollegeadd = TextEditingController();
TextEditingController gcollegecity = TextEditingController();
TextEditingController gcollegepincode = TextEditingController();
TextEditingController guniversity = TextEditingController();
TextEditingController ganygapp = TextEditingController();
TextEditingController ggapyear = TextEditingController();
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
          title: Text("Student Graduation Details",style: TextStyle(color: Colors.black),),
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
                              controller: gdegree,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation Degree',
                                  hintText: 'Enter graduation degree'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: specialization,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation Specification',
                                  hintText: 'Enter graduation specification'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: yearcomplete,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation Complete Year',
                                  hintText: 'Enter graduation complete year'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: cgpi,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation CGPI',
                                  hintText: 'Enter Graduation CGPI'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: percentage,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation Percentage',
                                  hintText: 'Enter graduation percentage'),
                              ),
                          ),
                          
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: gclass,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation Class',
                                  hintText: 'Enter graduation class'),
                              ),
                          ),
                          
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: gcollegename,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation College',
                                  hintText: 'Enter graduation college'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: gcollegeadd,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation College Address',
                                  hintText: 'Enter graduation college address'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: gcollegecity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation College City',
                                  hintText: 'Enter graduation college city'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: gcollegepincode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation College Pincode',
                                  hintText: 'Enter graduation college pincode'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: guniversity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Graduation University',
                                  hintText: 'Enter graduation university'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: ganygapp,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Education Gap',
                                  hintText: 'Enter education gap'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: ggapyear,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Gap Year',
                                  hintText: 'Enter gap year'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                            sid=userobj!.student[0].sid;
                                               // eid=studentobj!.student[0].eid;
                                                inspect("sid--:"+sid);
                                               // inspect("eid--:"+eid);
                                             studg(sid,gdegree.text,specialization.text,yearcomplete.text,cgpi.text,percentage.text,gclass.text,gcollegename.text,gcollegeadd.text,gcollegecity.text,gcollegepincode.text,guniversity.text,ganygapp.text,ggapyear.text);
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentTweD()));
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
  Future studg(String sid,String gdegree,String specialization,String yearcomplete,String cgpi,String percentage,String gclass,String gcollegename,String gcollegeadd,String gcollegecity,String gcollegepincode,String guniversity,String ganygapp,String ggapyear) async {
  String purl = url+"?what=studg&sid=${sid}&gdegree=${gdegree}&specialization=${specialization}&yearcomplete=${yearcomplete}&cgpi=${cgpi}&percentage=${percentage}&gclass=${gclass}&gcollegename=${gcollegename}&gcollegeadd=${gcollegeadd}&gcollegecity=${gcollegecity}&gcollegepincode=${gcollegepincode}&guniversity=${guniversity}&ganygapp=${ganygapp}&ggapyear=${ggapyear}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }

}