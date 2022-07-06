import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/studenteditprofile.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/tendeatilsapi.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({ Key? key }) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  int view=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
    getuserdata();
  }

  getuserdata() async
  {
    inspect("hi");
    //var sid=userobj1!.student[0].sid;
    userobj1= await getstudentdetails("1");
    //inspect(userobj1);
    //userobj= await getuser();
    setState(() {
      view=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title:  const Text('My Profile', style: TextStyle(color: Colors.black),),
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
          height: 2200,
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
              Text("MY PROFILE", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj1!.student[0].surname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Surname",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj1!.student[0].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Name",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj1!.student[0].fname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Father Name",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj1!.student[0].gname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("GrandFather Name",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.female_outlined),
              title: Text(userobj1!.student[0].gender,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Gender",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_alt_rounded),
              title: Text(userobj1!.student[0].category,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Category",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(userobj1!.student[0].prino,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Primary Number",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(userobj1!.student[0].alterno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Alternative Number",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(userobj1!.student[0].parentno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Perents Number",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].dob,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Date Of Birth",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].langeng,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Language Eng",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].langhindi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Language Hindi",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].langguj,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Language Gujrati",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].langmarathi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Language Marathi",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].langother,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Language Other",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].preadd,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Present Add",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].precity,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Present City",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].prepincode,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Present Pincode",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].prestate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Present State",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].peradd,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Permenemt Add",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].percity,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Permenemt City",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].perpincode,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Permenemt Pincode",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].perstate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Permenemt State",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].pancardno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Pancard No",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].adharno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Adharcard No ",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(userobj1!.student[0].dlicenceno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Licence No ",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.bloodtype),
              title: Text(userobj1!.student[0].bgroup,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Blood Group",style: TextStyle(color: Colors.grey[600]),),
            ),
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditStudentProfile()));      
                                  },
                                  child:  const Text('Edit Profile',
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