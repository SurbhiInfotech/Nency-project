import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/addqualificationapi.dart';
import 'package:placement/editaddqualification.dart';
import 'package:placement/editpostgraduation.dart';
import 'package:placement/edittendetails.dart';
import 'package:placement/edittwelvedetails.dart';
import 'package:placement/postgraduationapi.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/twelvedetailsapi.dart';

class Studcompanyselection extends StatefulWidget {
  const Studcompanyselection({ Key? key }) : super(key: key);

  @override
  State<Studcompanyselection> createState() => _StudcompanyselectionState();
}

class _StudcompanyselectionState extends State<Studcompanyselection> {
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
   addqualificationobj= await getadditionalqualification("1");
    //inspect(userobj2);
    setState(() {
      view=1;
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title:  const Text('Additional Qualification Details', style: TextStyle(color: Colors.black),),
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
              Text("Additional Qualification Details", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(addqualificationobj!.student[0].addqualification,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Add Qualification",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(addqualificationobj!.student[0].cmatscore,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("CMAT Score",style: TextStyle(color: Colors.grey[600]),),
            ),
            
           
            
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditStudAddQualification()));      
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