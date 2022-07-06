//import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/main.dart';
import 'package:placement/studentviewprofile.dart';
import 'coupstudent10thdetail.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:http/http.dart' as http;

//enum SingingCharacterr { Male , Female }
class EditStudentProfile extends StatefulWidget {
  
  const EditStudentProfile({ Key? key }) : super(key: key);

  @override
  
  State<EditStudentProfile> createState() => _EditStudentProfileState();
}

class _EditStudentProfileState extends State<EditStudentProfile> {


/*List<Map> languageknown = [
    {"name": "Read", "isChecked": false},
    {"name": "Write", "isChecked": false},
    {
      "name": "Speak",
      "isChecked": false,
    },
];
*/
bool _isChecked = true;
  String _currText = '';

  Map<String,bool> list= {
    'Read':false,
    'Write':false,
    'Speak':false,
  };
  //var holder_1 = [];  
 final lang=[
   CheckBoxState(title: 'Read'),
  CheckBoxState(title: 'Write'),
  CheckBoxState(title: 'Speak'),
   CheckBoxState(title: 'Dont Know'),
 ];

String curr='';

  String _selectedGender = userobj1!.student[0].gender;
  String _selectedlang='';
  int? _value;
TextEditingController surname = TextEditingController(text: userobj1!.student[0].surname);
TextEditingController name = TextEditingController(text: userobj1!.student[0].name);
TextEditingController fname = TextEditingController(text: userobj1!.student[0].fname);
TextEditingController gname = TextEditingController(text: userobj1!.student[0].gname);
TextEditingController gender = TextEditingController(text: userobj1!.student[0].gender);
TextEditingController category = TextEditingController(text: userobj1!.student[0].category);
TextEditingController prino = TextEditingController(text: userobj1!.student[0].prino);
TextEditingController alterno = TextEditingController(text: userobj1!.student[0].alterno);
TextEditingController parentno = TextEditingController(text: userobj1!.student[0].parentno);
TextEditingController dob = TextEditingController(text: userobj1!.student[0].dob);
TextEditingController langeng = TextEditingController(text: userobj1!.student[0].langeng);
TextEditingController langhindi = TextEditingController(text: userobj1!.student[0].langhindi);
TextEditingController langguj = TextEditingController(text: userobj1!.student[0].langguj);
TextEditingController langmarathi = TextEditingController(text: userobj1!.student[0].langmarathi);
TextEditingController langother = TextEditingController(text: userobj1!.student[0].langother);
TextEditingController preadd = TextEditingController(text: userobj1!.student[0].preadd);
TextEditingController precity = TextEditingController(text: userobj1!.student[0].precity);
TextEditingController prepincode = TextEditingController(text: userobj1!.student[0].prepincode);
TextEditingController prestate = TextEditingController(text: userobj1!.student[0].prestate);
TextEditingController peradd = TextEditingController(text: userobj1!.student[0].peradd);
TextEditingController percity = TextEditingController(text: userobj1!.student[0].percity);
TextEditingController perpincode = TextEditingController(text: userobj1!.student[0].perpincode);
TextEditingController perstate = TextEditingController(text: userobj1!.student[0].perstate);
TextEditingController pancardno = TextEditingController(text: userobj1!.student[0].pancardno);
TextEditingController adharno = TextEditingController(text: userobj1!.student[0].adharno);
TextEditingController dlicenceno = TextEditingController(text: userobj1!.student[0].dlicenceno);
TextEditingController bgroup = TextEditingController(text: userobj1!.student[0].bgroup);
var gen=userobj1!.student[0].gender;

//TextEditingController 
//SingingCharacterr? _characters = SingingCharacterr.Male;
//String? gen;
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
    //userobj= await getuser(eid);
    setState(() {
      view=1;
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Edit Personal Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
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
                              controller: surname,
                             // initialValue: userobj1!.student[0].surname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'surname',
                                  
                                  hintText: 'Enter Surname'),
                              ),
                              
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
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
                              controller: gname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Grandfather Name',
                                  hintText: 'Enter Grandfather Name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                         /* Container(
                            child: TextFormField(
                              controller: gender,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Gender',
                                  hintText: 'Enter Gender'),
                              ),
                          ),*/

                          

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
                              controller: category,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Category',
                                  hintText: 'Enter Category'),
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
                            child: TextFormField(
                              controller: parentno,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Parents No',
                                  hintText: 'Enter Parents No'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: dob,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Date Of Birth',
                                  hintText: 'Enter dob'),
                              ),
                          ),

                          SizedBox(height: 10,),
                         /* Container(
                            child: CheckboxListTile(
                              title: Text("Read"),
                              selected: true,
                           //   controlAffinity: ListTileControlAffinity.values,
                             value: false,
                             onChanged: (value){
                               setState(() {
                                 curr=value.toString();
                                 inspect(curr);
                               });
                             },
                           ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: CheckboxListTile(
                              title: Text("Write"),
                              selected: false,
                           //   controlAffinity: ListTileControlAffinity.values,
                             value: true,
                             onChanged: (value){
                               setState(() {
                                 curr=value.toString();
                                 inspect(curr);
                               });
                             },
                           ),
                          ),*/
                         // SizedBox(height: 100,),
                       /*   Container(
                            child: SizedBox(
                              height: 230 ,
                              child: ListView(
                                children: [
                                    ...lang.map(buildSingleCheckbox).toList(),
                                   // inspect()
                                ],
                               // controller: dob,
                               // leading:  ...lang.map(buildSingleCheckbox).toList(),
                                ),
                            ),
                          ),*/
                          
                         // SizedBox(height: 10,),
                          /*Container(
                            
                                child:new  ListView(
                                 // scrollDirection: Axis.horizontal,
                                 // padding: EdgeInsets.all(12),
                                  children: [
                                    ...lang.map(buildSingleCheckbox).toList(),
                                  ],
                                  ),
                              
                            
                          ),*/
                        SizedBox(height: 10,),                          

                       /* Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Center(
                                        child: Text(_currText,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    )*/
                        
                        /* Column(
                children: languageknown.map((hobby) {
              return CheckboxListTile(
                  value: hobby["isChecked"],
                  title: Text(hobby["name"]),
                  onChanged: (newValue) {
                    setState(() {
                      hobby["isChecked"] = newValue;
                      inspect(hobby);
                    });
                  });
            }).toList()),*/

                         Container(
                            child: TextFormField(
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
                              controller: dlicenceno,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Driving licence no',
                                  hintText: 'Enter Driving licence no'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
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
                                             var sid=userobj1!.student[0].sid;
                                            inspect(sid);
                                            studprofile(sid,surname.text,name.text,fname.text,gname.text,_selectedGender.toString(),category.text,prino.text,alterno.text,parentno.text,dob.text,langeng.text,langhindi.text,langguj.text,langmarathi.text,langother.text,preadd.text,precity.text,prepincode.text,prestate.text,peradd.text,percity.text,perpincode.text,perstate.text,pancardno.text,adharno.text,dlicenceno.text,bgroup.text);
                                            
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
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
  Widget buildSingleCheckbox(CheckBoxState checkbox)=>CheckboxListTile(
  controlAffinity: ListTileControlAffinity.leading,
  value: checkbox.value, 
  title: Text(
    checkbox.title,
  ),
  onChanged: (value)=>setState(()=>checkbox.value=value!),
  
);

  Future studprofile(String sid,String surname,String name,String fname,String gname,String _selectedGender,String category,String prino,String alterno,String parentno,String dob,String langeng,String langhindi,String langguj,String langmarathi,String langother,String preadd,String precity,String prepincode,String prestate,String peradd,String percity,String perpincode,String perstate,String pancardno,String adharno,String dlicenceno,String bgroup) async {
  String purl = url+"?what=studenteditprofile&sid=${sid}&surname=${surname}&name=${name}&fname=${fname}&gname=${gname}&gender=${_selectedGender}&category=${category}&prino=${prino}&alterno=${alterno}&parentno=${parentno}&dob=${dob}&langeng=${langeng}&langhindi=${langhindi}&langguj=${langguj}&langmarathi=${langmarathi}&langother=${langother}&preadd=${preadd}&precity=${precity}&prepincode=${prepincode}&prestate=${prestate}&peradd=${peradd}&percity=${percity}&perpincode=${perpincode}&perstate=${perstate}&pancardno=${pancardno}&adharno=${adharno}&dlicenceno=${dlicenceno}&bgroup=${bgroup}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
  return pres.body;
}
}

class CheckBoxState{
  late final String title;
  late bool value;

  CheckBoxState({
    required this.title,
    this.value=false,
  });

}
