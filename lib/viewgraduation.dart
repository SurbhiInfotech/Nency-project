import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/editgraduation.dart';
import 'package:placement/edittendetails.dart';
import 'package:placement/edittwelvedetails.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/graduationapi.dart';

class StudViewGraduation extends StatefulWidget {
  const StudViewGraduation({ Key? key }) : super(key: key);

  @override
  State<StudViewGraduation> createState() => _StudViewGraduationState();
}

class _StudViewGraduationState extends State<StudViewGraduation> {
  int view=0;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  
    getstudgraduation();
  }

  getstudgraduation() async
  {
    //inspect("krishna");
    graduationobj= await getgraduation("1");
   //graduationobj = await getgraduation();
    //inspect(userobj2);
    setState(() {
      view=1;
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title:  const Text('Graduation Details', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>StudViewOption()));
          },
        ),
      ),
      body: view==0 ? CircularProgressIndicator() : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          height: 1100,
          width:double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(10), 
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.2), 
                  spreadRadius: 3, 
                  blurRadius: 7, 
                  offset: Offset(0, 2), 
               ),
              ],
          ),
          child:Column(
            children: [
              Padding(padding: EdgeInsets.all(10),),
              Text("Graduation Details", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.book_online_sharp),
              title: Text(graduationobj!.student[0].gdegree,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Degree",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(graduationobj!.student[0].specialization,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Specialization",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(graduationobj!.student[0].yearcomplete,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Year Complete",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(graduationobj!.student[0].cgpi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("CGPI",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.female_outlined),
              title: Text(graduationobj!.student[0].percentage,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Percentage",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_alt_rounded),
              title: Text(graduationobj!.student[0].gclass,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Class",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(graduationobj!.student[0].gcollegename,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("college name",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(graduationobj!.student[0].gcollegeadd,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("College Address",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(graduationobj!.student[0].gcollegecity,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("College City",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(graduationobj!.student[0].gcollegepincode,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("College Pincode",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(graduationobj!.student[0].guniversity,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("University",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(graduationobj!.student[0].ganygapp,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Any Year",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(graduationobj!.student[0].ggapyear,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Gap Year",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditStudentGradD()));      
                                  },
                                  child:  const Text('Edit Graduation Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                ),
                              alignment: Alignment.center,
                              width: 250,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color.fromRGBO(162, 29, 65, 1.0)
                                 ),
                               
                                ),
                            ),
            ],
          )
          ),
       )
    )
    );
  }
}