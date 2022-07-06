import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/editpostgraduation.dart';
import 'package:placement/edittendetails.dart';
import 'package:placement/edittwelvedetails.dart';
import 'package:placement/postgraduationapi.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/twelvedetailsapi.dart';

class StudViewPostgraduation extends StatefulWidget {
  const StudViewPostgraduation({ Key? key }) : super(key: key);

  @override
  State<StudViewPostgraduation> createState() => _StudViewPostgraduationState();
}

class _StudViewPostgraduationState extends State<StudViewPostgraduation> {
  int view=0;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  
    getpg();
  }

  getpg() async
  {
    //inspect("krishna");
   postgobj= await getpostgraduation("1");
    //inspect(userobj2);
    setState(() {
      view=1;
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title:  const Text('PostGraduation Details', style: TextStyle(color: Colors.black),),
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
              Text("PostGraduation Details", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(postgobj!.student[0].mbaspecialization,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("MBA Specialization",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(postgobj!.student[0].semonemark,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Sem 1 Marks",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(postgobj!.student[0].semteomark,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Sem 2 Marks",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(postgobj!.student[0].semthreemark,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Sem 3 Marks",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditStudentPostgraduation()));      
                                  },
                                  child:  const Text('Edit PostGraduation Details',
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