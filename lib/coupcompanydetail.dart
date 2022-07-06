import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/cohome.dart';
import 'package:placement/companyapi.dart';
import 'package:placement/coupcdetails.dart';
//import 'package:placement/coupcompanyhiring.dart';
//import 'package:placement/coupcompanyhiring.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/main.dart';
//import 'package:placement/hiringapi.dart';
import 'package:placement/option.dart';
import 'package:http/http.dart' as http;
var cid;
class UpCompanyD extends StatefulWidget {
  const UpCompanyD({ Key? key }) : super(key: key);

  @override
  State<UpCompanyD> createState() => _UpCompanyDState();
}

class _UpCompanyDState extends State<UpCompanyD> {

TextEditingController cname = TextEditingController();
TextEditingController about = TextEditingController();
TextEditingController contactno = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Company Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCompany()));
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
                          Container(
                            child: TextFormField(
                              controller: cname,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Company Name',
                                  hintText: 'Enter company name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: about,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'About',
                                  hintText: 'Enter about'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: contactno,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Contact Number',
                                  hintText: 'Enter contact number'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             company(cname.text, about.text, contactno.text);
                                          //getcompany();
                                           //  cid=userobj3!.student[0].cid;
                                           //  inspect("here cid:"+cid);
                                           
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCompanyH()));
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
  Future company(String cname,String about,String contactno) async {
    //inspect(cname);
   // inspect(about);
   // inspect(contactno);
  String purl = url+"?what=companydetails&cname=${cname}&about=${about}&contactno=${contactno}";
      //";
     var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
getcompanyin();

  return pres.body;
  }

  //max id
  Student? compobj;
  Future<Student?> getcompanyin() async
{
 // var cid=userobj3!.student[0].cid;
  //inspect("kk:-"+cid);
  inspect("Working");
  
  String urls=url+"?what=getcompanyin";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
    compobj=studentFromJson(res.body);
   cid = compobj!.student[0].cid;
   inspect(cid);
    return compobj;
    
  //  var cid=userobj3!.student[0].cid;
    inspect("hello");

  //inspect(userobj3);
  }
}
}

//hiring insert

class UpCompanyH extends StatefulWidget {
  const UpCompanyH({ Key? key }) : super(key: key);

  @override
  State<UpCompanyH> createState() => _UpCompanyHState();
}

class _UpCompanyHState extends State<UpCompanyH> {

TextEditingController desioffer = TextEditingController();
TextEditingController roles = TextEditingController();
TextEditingController othrequirement = TextEditingController();
TextEditingController department = TextEditingController();
TextEditingController sector = TextEditingController();
TextEditingController location = TextEditingController();
TextEditingController jdate = TextEditingController();
TextEditingController status = TextEditingController();


String? primaryerror;
int view=0;

  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
   // getcompany();
 
//cid=compobj!.student[0].cid;
                                             
//inspect("ccid"+cid);
    getcompanydata();
  }

  getcompanydata() async
  {
    //getcompanyin();
   
     //cid=compobj!.student[0].cid;
     //inspect("cidkri:"+cid);
  
    //userobj= await getuser(eid);
    setState(() {
      view=1;
      
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Company Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCompany()));
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
                          Container(
                            child: TextFormField(
                              controller: desioffer,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Designation offered',
                                  hintText: 'Enter designation offered'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: roles,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Roles',
                                  hintText: 'Enter roles'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: othrequirement,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Other Requirement',
                                  hintText: 'Enter other requirement'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: department,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Department',
                                  hintText: 'Enter department'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: sector,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Sectors',
                                  hintText: 'Enter sectors'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: location,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Location',
                                  hintText: 'Enter location'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: jdate,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Joining Date',
                                  hintText: 'Enter joining date'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: status,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Status',
                                  hintText: 'Enter status'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                              
                                              //cid=ccid;
                                             
                                             companyhiring(cid,desioffer.text, roles.text, othrequirement.text, department.text, sector.text, location.text, jdate.text, status.text);
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCompany()));
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
  Future companyhiring(String cid,String desioffer,String roles,String othrequirement,String department,String sector,String location,String jdate,String status) async {
    inspect("in hiring");
   // inspect(cid);
    //inspect();
  String purl = url+"?what=companyhiringdetails&cid=${cid}&desioffer=${desioffer}&roles=${roles}&othrequirement=${othrequirement}&department=${department}&sector=${sector}&location=${location}&jdate=${jdate}&status=${status}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
  return pres.body;
  }
}

