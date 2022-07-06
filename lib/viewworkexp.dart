import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/editgraduation.dart';
import 'package:placement/edittendetails.dart';
import 'package:placement/edittwelvedetails.dart';
import 'package:placement/editworkexp.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/graduationapi.dart';
import 'package:placement/workexpapi.dart';

class StudViewWorkexp extends StatefulWidget {
  const StudViewWorkexp({ Key? key }) : super(key: key);

  @override
  State<StudViewWorkexp> createState() => _StudViewWorkexpState();
}

class _StudViewWorkexpState extends State<StudViewWorkexp> {
  int view=0;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  
    getstudworkexp();
  }

  getstudworkexp() async
  {
    //inspect("krishna");
    workexpobj= await getworkexp("1");
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
        title:  const Text('Work Experience Details', style: TextStyle(color: Colors.black),),
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
              Text("Work Experience Details", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.book_online_sharp),
              title: Text(workexpobj!.student[0].totalworkexp,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Total Workexp",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(workexpobj!.student[0].lastsalary,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Last Salary",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(workexpobj!.student[0].firstorgname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("First Organization Name",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(workexpobj!.student[0].firstdesignation,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("First Designation",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.female_outlined),
              title: Text(workexpobj!.student[0].firstduration,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("First Duration",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_alt_rounded),
              title: Text(workexpobj!.student[0].secorgname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Second Organizition Name",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(workexpobj!.student[0].secdesignation,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Second Designation",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(workexpobj!.student[0].secduration,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Second Duration",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditStudentWorkExp()));      
                                  },
                                  child:  const Text('Edit Details',
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