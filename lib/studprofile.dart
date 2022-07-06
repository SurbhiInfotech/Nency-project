import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/login.dart';
import 'package:placement/main.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/studhome.dart';

class MyProfile1 extends StatefulWidget {
  const MyProfile1({ Key? key }) : super(key: key);

  @override
  State<MyProfile1> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile1> {

  int view=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
    getstudentdetails();
  }

  getstudentdetails() async
  {
    //userobj= await getuser();
    setState(() {
      view=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('My Profile', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
        ),
      ),
      body: view==0 ? CircularProgressIndicator() : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          height: 1410,
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
              title: Text(userobj1!.student[0].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Name",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj1!.student[0].surname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("surname",style: TextStyle(color: Colors.grey[600]),),
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
              trailing: Text("Caste",style: TextStyle(color: Colors.grey[600]),),
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
              trailing: Text("Secondary Number",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text(userobj1!.student[0].parentno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Permanent Number",style: TextStyle(color: Colors.grey[600]),),
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
              trailing: Text("Register Date",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.bloodtype),
              title: Text(userobj1!.student[0].bgroup,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Blood Group",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.filter_tilt_shift),
              title: Text(userobj1!.student[0].langhindi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Shift",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.local_activity),
              title: Text(userobj1!.student[0].langguj,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Activity",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.archive_outlined),
              title: Text(userobj1!.student[0].langmarathi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Achivement",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text(userobj1!.student[0].langother,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Message",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text(userobj1!.student[0].pancardno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("email",style: TextStyle(color: Colors.grey[600]),),
            ),
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudViewOption()));      
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
    );
  }
}

enum SingingCharacter { Male , Female }
enum SingingCharacters { Day , Night }

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isObscurePassword = true;
  SingingCharacter? _character = SingingCharacter.Male;
  SingingCharacters? _characters = SingingCharacters.Day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  const Text('My Profile',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4,color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white
                          ),
                          color: Colors.blue
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                  ),
              ),
              const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Full Name',
                    suffixIcon: Icon(Icons.person_outline_rounded,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.email_outlined,size: 17,),
                    ),
                 ),
                ),
              const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Enrollment No.',
                    suffixIcon: Icon(Icons.format_align_left,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Father Name',
                    suffixIcon: Icon(Icons.person_outline_rounded,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'GrandFather Name',
                    suffixIcon: Icon(Icons.person_outline_rounded,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: const Text("Gender"),
                ),
                ListTile(
                title: const Text('Male'),
                leading: Radio<SingingCharacter>(
                value: SingingCharacter.Male,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                setState(() {
                    _character = value;
                  });
                },
              ),
              ),
              ListTile(
                  title: const Text('Female'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.Female,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Caste',
                    suffixIcon: Icon(Icons.person_outline_rounded,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Primary No.',
                    suffixIcon: Icon(Icons.phone,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Secondary No.',
                    suffixIcon: Icon(Icons.phone,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Permanent No.',
                    suffixIcon: Icon(Icons.phone,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Date Of Birth',
                    suffixIcon: Icon(Icons.calendar_today_outlined,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Register Date',
                    suffixIcon: Icon(Icons.calendar_today_outlined,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Blood Group',
                    suffixIcon: Icon(Icons.bloodtype,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: const Text("Shift"),
                ),
                ListTile(
                title: const Text('Day'),
                leading: Radio<SingingCharacters>(
                value: SingingCharacters.Day,
                groupValue: _characters,
                onChanged: (SingingCharacters? value) {
                setState(() {
                    _characters = value;
                  });
                },
              ),
              ),
              ListTile(
                  title: const Text('Night'),
                  leading: Radio<SingingCharacters>(
                    value: SingingCharacters.Night,
                    groupValue: _characters,
                    onChanged: (SingingCharacters? value) {
                      setState(() {
                        _characters = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Activity',
                    suffixIcon: Icon(Icons.local_activity_outlined,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Achivement',
                    suffixIcon: Icon(Icons.star_border_outlined,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                    labelText: 'Message',
                    suffixIcon: Icon(Icons.message_outlined,size: 17,),
                    ),
                 ),
                ),
                const SizedBox(height: 20,),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: InkWell(
                                  onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                },
                                  child: const Text('Save',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                ),
                                ),
                            ),
                          ),
            ],
          ),
        ),
      ),
    );
  }
}