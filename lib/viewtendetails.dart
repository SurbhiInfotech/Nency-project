import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/edittendetails.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/studentprofileapi.dart';

class StudViewTenDetails extends StatefulWidget {
  const StudViewTenDetails({ Key? key }) : super(key: key);

  @override
  State<StudViewTenDetails> createState() => _StudViewTenDetailsState();
}

class _StudViewTenDetailsState extends State<StudViewTenDetails> {
  int view=0;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  
    gettendetail();
  }

  gettendetail() async
  {
    inspect("krishna");
    userobj2= await gettendetails("1");
    //inspect(userobj2);
    setState(() {
      view=1;
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title:  const Text('10th Details', style: TextStyle(color: Colors.black),),
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
              Text("10th Details", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj2!.student[0].tpassingyear,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Passing Year",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj2!.student[0].tcgpi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("CGPI",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj2!.student[0].tpercentage,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Percentage",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj2!.student[0].tclass,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Class",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.female_outlined),
              title: Text(userobj2!.student[0].tspecialization,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Specialization",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_alt_rounded),
              title: Text(userobj2!.student[0].tschoolname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("School Name",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(userobj2!.student[0].tschooladd,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("School Address",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(userobj2!.student[0].tschoolcity,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("School City",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(userobj2!.student[0].tschoolpincode,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("School Pincode",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj2!.student[0].tboard,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Board",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj2!.student[0].tanygap,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Any Gap",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj2!.student[0].tgapyear,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Gap Year",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Edittendetails()));      
                                  },
                                  child:  const Text('Edit 10 Details',
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