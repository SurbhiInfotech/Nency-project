//import 'dart:developer';

// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:placement/coupsdetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement/coupstudentgraddetail.dart';
import 'package:placement/coupstudentpostgraduation.dart';
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';

import 'coupstudent10thdetail.dart';
//import 'package:flutter_session/flutter_session.dart';
var sid;
//var eid;
bool userNameValidate = false;
var holder_1 = [];
 Map<String, bool> List = {
    'Egges' : false,
    'Chocolates' : false,
    'Flour' : false,
    'Fllower' : false,
    'Fruits' : false,
  };
//final _formKey = GlobalKey<FormState>();

class UpStudentD extends StatefulWidget {
  @override
  
  const UpStudentD({ Key? key }) : super(key: key);

  @override
  _UpStudentDState createState() => _UpStudentDState();
}

class _UpStudentDState extends State<UpStudentD> {
/*void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      valid="empty";
      return;
    }
  }*/
int? _value;
String _selectedGender = 'male';
DateTime currentDate = DateTime.now();
 Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1997),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
 bool _validate = false;
TextEditingController surname = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController fname = TextEditingController();
TextEditingController gname = TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController category = TextEditingController();
TextEditingController prino = TextEditingController();
TextEditingController alterno = TextEditingController();
TextEditingController parentno = TextEditingController();
TextEditingController dob = TextEditingController();
TextEditingController langeng = TextEditingController();
TextEditingController langhindi = TextEditingController();
TextEditingController langguj = TextEditingController();
TextEditingController langmarathi = TextEditingController();
TextEditingController langother = TextEditingController();
TextEditingController preadd = TextEditingController();
TextEditingController precity = TextEditingController();
TextEditingController prepincode = TextEditingController();
TextEditingController prestate = TextEditingController();
TextEditingController peradd = TextEditingController();
TextEditingController percity = TextEditingController();
TextEditingController perpincode = TextEditingController();
TextEditingController perstate = TextEditingController();
TextEditingController pancardno = TextEditingController();
TextEditingController adharno = TextEditingController();
TextEditingController dlicenceno = TextEditingController();
TextEditingController bgroup = TextEditingController();
late SharedPreferences prefs;
var valid;
 @override
  void dispose() {
    surname.dispose();
    super.dispose();
  }

//TextEditingController 
String? primaryerror;
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

final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var _genderRadioBtnVal;
    var _handleGenderChange;
    return SafeArea(
    key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Personal Details",style: TextStyle(color: Colors.black),),
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
                              
                             /* validator: (surname) {
                                if (surname == null || surname.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                                  controller: surname,
                                  decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Surname',
                                  hintText: 'Enter Surname',
                                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                 
                                
                                  ),
                                
                       
                              ),
                              
                          ),
                          
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (name) {
                                if (name == null || name.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: name,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                  hintText: 'Enter Middle Name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                             /* validator: (fname) {
                                if (fname == null || fname.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: fname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Father Name',
                                  hintText: 'Enter Father Name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                           /*   validator: (gname) {
                                if (gname == null || gname.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: gname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Grandfather Name',
                                  hintText: 'Enter Grandfather Name'),
                              ),
                          ),
                          
                          SizedBox(height: 10,),

  

                         Container(
                            
                              child: Padding(padding: EdgeInsets.only(left: 10),
                              child: Text("Gender",),
                              ),
                            ),

                            ListTile(
                              
                            title: Text('Male'),
                           
                           // selected: true,
                            leading: Radio<String>(
                            value: 'male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                            setState(() {
                                
                               _selectedGender = value!;
                                  //gen=_characters.to_selectedGender = value!;String();
                                inspect(_selectedGender);
                              });
                            },
                          ),
                          ),
                          ListTile(
                           // selected: true,
                              title: const Text('Female'),
                              leading: Radio<String>(
                                
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                            ),

                            
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                             /* validator: (category) {
                                if (category == null || category.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: category,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Caste',
                                  hintText: 'Enter Caste'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextField(
                              controller: prino,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Primary No',
                                  hintText: 'Enter Primary No',
                                  errorText: primaryerror,
                                   counterText: ''),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: alterno,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Alternative No',
                                  hintText: 'Enter Alternative No'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: 
                            TextFormField(
                              controller: parentno,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Parents No',
                                  hintText: 'Enter Parents No'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: 
                            
                              Row(
                                  children: [
                                    
                                     Text("Birth Date",),
                                    SizedBox(width: 10,),
                                    Row(
                                      children: [
                                OutlinedButton(
                                onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
                              ],
                                    ),
                                  ],
                            ),
                          ),
                          /*Container(
                            child: TextFormField(
                              controller: dob,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Date Of Birth',
                                  hintText: 'Enter dob'),
                              ),
                          ),*/
                          SizedBox(height: 10,),
                          
                          Container(
                            child: TextFormField(
                           /*   validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: langeng,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'English Language',
                                  hintText: 'Enter yes/no'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                             /* validator: (langhindi) {
                                if (langhindi == null || langhindi.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: langhindi,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Hindi Language',
                                  hintText: 'Enter yes/no'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                          /*    validator: (langguj) {
                                if (langguj == null || langguj.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: langguj,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Gujarati Language',
                                  hintText: 'Enter yes/no'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              /*validator: (langmarathi) {
                                if (langmarathi == null || langmarathi.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: langmarathi,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Marathi Language',
                                  hintText: 'Enter yes/no'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              /*validator: (langother) {
                                if (langother == null || langother.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: langother,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Other Language',
                                  hintText: 'Enter name of Language'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (preadd) {
                                if (preadd == null || preadd.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: preadd,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Present Address',
                                  hintText: 'Enter Present Address'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (precity) {
                                if (precity == null || precity.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: precity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Present City',
                                  hintText: 'Enter Present City'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (prepincode) {
                                if (prepincode == null || prepincode.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: prepincode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Present Pincode',
                                  hintText: 'Enter Present Pincode'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                             /* validator: (prestate) {
                                if (prestate == null || prestate.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: prestate,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Present State',
                                  hintText: 'Enter Present State'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (peradd) {
                                if (peradd == null || peradd.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: peradd,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Permenemt Address',
                                  hintText: 'Enter Permenemt Address'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                             /* validator: (percity) {
                                if (percity == null || percity.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: percity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Permenemt City',
                                  hintText: 'Enter Permenemt City'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                           /*   validator: (perpincode) {
                                if (perpincode == null || perpincode.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: perpincode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Permenemt Pincode',
                                  hintText: 'Enter Permenemt Pincode'),
                              ),
                          ),
                           SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                             /* validator: (perstate) {
                                if (perstate == null || perstate.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: perstate,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Permenemt State',
                                  hintText: 'Enter Permenemt State'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (pancardno) {
                                if (pancardno == null || pancardno.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: pancardno,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Pancard no',
                                  hintText: 'Enter Pancard no'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (adharno) {
                                if (adharno == null || adharno.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: adharno,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Adharcard no',
                                  hintText: 'Enter Adharcard no'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                             /* validator: (dlicenceno) {
                                if (dlicenceno == null || dlicenceno.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: dlicenceno,
                              
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Driving licence no',
                                  hintText: 'Enter Driving licence no',
                                  errorText: valid,
                                  ),
                                  
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                            /*  validator: (bgroup) {
                                if (bgroup == null || bgroup.isEmpty) {
                                  return 'Please enter some text';
                                 // inspect("hi in valid");
                                 // showAlert(context);
                                }
                                return null;
                              },*/
                              controller: bgroup,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Blood Group',
                                  hintText: 'Enter Blood Group'),
                              ),
                          ),
                              
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             /*setState(() {
                                               validateTextField(surname.text);
                                               /*if (_formKey.currentState!.validate()) {
                                            showAlert(context);
                                          valid="please Enter vaule";
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      //valid="empty";
    }*/
                                             });*/
                                          
  
                                          //  _saveForm();
                                           var sid=userobj!.student[0].sid;
                                            inspect(sid);
                                            studprofile(sid,surname.text,name.text,fname.text,gname.text,_selectedGender.toString(),category.text,prino.text,alterno.text,parentno.text,currentDate.toString(),langeng.text,langhindi.text,langguj.text,langmarathi.text,langother.text,preadd.text,precity.text,prepincode.text,prestate.text,peradd.text,percity.text,perpincode.text,perstate.text,pancardno.text,adharno.text,dlicenceno.text,bgroup.text);
                                            //inspect(eid);
                                            //var heid;
                                            
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentPostgraduation()));
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
  void showAlert(BuildContext context) {
    
                                        
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Text("You Have Already Selected in 2 Companies"),
                                            ));
                                        }
  Future studprofile(String sid,String surname,String name,String fname,String gname,String _selectedGender,String category,String prino,String alterno,String parentno,String currentDate,String langeng,String langhindi,String langguj,String langmarathi,String langother,String preadd,String precity,String prepincode,String prestate,String peradd,String percity,String perpincode,String perstate,String pancardno,String adharno,String dlicenceno,String bgroup) async {
  String purl = url+"?what=studentprofile&sid=${sid}&surname=${surname}&name=${name}&fname=${fname}&gname=${gname}&gender=${_selectedGender}&category=${category}&prino=${prino}&alterno=${alterno}&parentno=${parentno}&currentDate=${currentDate}&langeng=${langeng}&langhindi=${langhindi}&langguj=${langguj}&langmarathi=${langmarathi}&langother=${langother}&preadd=${preadd}&precity=${precity}&prepincode=${prepincode}&prestate=${prestate}&peradd=${peradd}&percity=${percity}&perpincode=${perpincode}&perstate=${perstate}&pancardno=${pancardno}&adharno=${adharno}&dlicenceno=${dlicenceno}&bgroup=${bgroup}";
      //";
    
   
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
  
  return pres.body;
}

bool validateTextField(String surname) {
  inspect("in funcation");
    if (surname.isEmpty) {
      setState(() {
        _validate = true;
      });
      return false;
    }
    
    setState(() {
      _validate = false;
    });
    return true;
  }
/*getSharedPreferences () async
{
    prefs = await SharedPreferences.getInstance();
}
saveStringValue () async
  {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("1",eid);
  }
  retrieveStringValue () async
 {
   prefs = await SharedPreferences.getInstance();
   String? value = prefs.getString("1");
   inspect("value:"+value!);
 }
  void getSring() {}

  void setString() {}*/
 getItems(){
    List.forEach((key, value) {
      if(value == true)
      {
        holder_1.add(key);
      }
    }); 
}
}
//pg


//gradduation

