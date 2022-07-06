import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/editinternship.dart';
import 'package:placement/editpostgraduation.dart';
import 'package:placement/edittendetails.dart';
import 'package:placement/edittwelvedetails.dart';
import 'package:placement/intershipapi.dart';
import 'package:placement/postgraduationapi.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/twelvedetailsapi.dart';

class StudViewInternship extends StatefulWidget {
  const StudViewInternship({ Key? key }) : super(key: key);

  @override
  State<StudViewInternship> createState() => _StudViewInternshipState();
}

class _StudViewInternshipState extends State<StudViewInternship> {
  int view=0;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  
    getstudinternship();
  }

  getstudinternship() async
  {
    //inspect("krishna");
   internobj= await getinternship("1");
    //inspect(userobj2);
    setState(() {
      view=1;
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title:  const Text('Summer Internship Details', style: TextStyle(color: Colors.black),),
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
              Text("Summer Internship Details", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(internobj!.student[0].siptitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Title",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(internobj!.student[0].sipcompany,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Company",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(internobj!.student[0].sipcity,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("City",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(internobj!.student[0].sippincode,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Pincode",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditStudSumInternD()));      
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