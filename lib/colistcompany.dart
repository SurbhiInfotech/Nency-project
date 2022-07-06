import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:placement/applyapi.dart';
import 'package:placement/coeditcompanydetails.dart';
import 'package:placement/cohome.dart';
import 'package:placement/studapply.dart';
import 'package:placement/hiringapi.dart';
import 'package:placement/main.dart';
import 'package:placement/sql.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';

import 'package:placement/studhome.dart';

import 'companyapi.dart';
late String cid;

class Listcompany extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ListcompanyState();
  }

}



class ListcompanyState extends State<Listcompany>{
  
  late List<List<dynamic>> employeeData;
  var employeeObj;
  var companydata;
  var companycount=0;
int view=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 // getcompanydetailss();
   getcomp();
  }

  getcomp() async
  {
    //inspect("hi");
    //var sid=userobj1!.student[0].sid;
    var employeeObj= await getcompanydisplay();
    //inspect(employeeObj.length);
    
    companydata=employeeObj;
    companycount=companydata.length;
    //var len=companydata;
    //inspect(employeeObj);
    //userobj= await getuser();
    setState(() {
      view=1;
    //  cid=hiringobj!.student[0].cid;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
        title:  const Text('Companies', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>CoHome()));
          },
        ),
      ),
  body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
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
      
              child:  Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10),),
                      Text("Companies", style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(162, 29, 65, 1.0)
                    ),
                    ),
                    SizedBox(height: 20,),
                    Divider(color: Colors.black,),
                    ListView.builder(
                    shrinkWrap: true,
                    itemCount: companycount,
                    itemBuilder: (context,index){
                     //inspect(companydata.length);
                      if(index>0)
                      {
                       // var eid = employeeObj[index]['cname'].toString();
                       // var email = employeeData[index][''].toString();
                       // var password = employeeData[index][2].toString();
                        //insertcsv(eid, email, password);
                      }
                      return Card(
                        
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              InkWell(
                                onTap:(){
                                  setState(() {
                                     cid=companydata[index]['cid'].toString();
                                     //inspect("CID: "+cid);
                                    // gethiringdetails(cid);
                                    //inspect(cid);
                                  });
                                  //final String var_cid;
                                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Acompany(cid)));
                                  //Navigator.push(context, MaterialPageRScreenArgumentsoute(builder: (context)=>Acompany(ScreenArguments(cid))));
                                  //Navigator.pushNamed(context, '/Acompany', arguments: (cid));
                                },
                              child:ListTile(
                              title:Text(companydata[index]['cname'].toString()),
                            // trailing: Text(companydata[index]['about'].toString()),
                             subtitle:Text(companydata[index]['contactno'].toString()),
                             trailing: Column(children: [
                               OutlinedButton(
                            onPressed: (){
                              setState(() {
                                 cid=companydata[index]['cid'].toString();
                              });
                             
                              inspect("cid::_"+cid);
                           getcompanyupdate(cid);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateCompanyD()),
    
    );
                            },
                            child: Text('Update'),
                          ),
                             ],),
                              ),
                             ), 
                              //Text(companydata[index][2].toString()),
                            ],
                          ),
                        ),
                      );
                    }
                    ),
                  ],
                ),
        ),
      ),
  ),         
    );
  }
  
getcompanydisplay() async
{
  //inspect("jkk");
    String urls=url+"?what=getcompanydetails";
    var res= await http.get(Uri.parse(urls));
    if(res.statusCode==200)
    {
      var employeeObjMain = jsonDecode(res.body);
      //employeeObj = employeeObjMain['student'];
      //inspect(employeeObj.length);
      //userobj3=studentFromJson(res.body);
      return employeeObjMain['student'];
      
    }
}

}


//update company

var companydata;
class UpdateCompanyD extends StatefulWidget {
  const UpdateCompanyD({ Key? key }) : super(key: key);

  @override
  State<UpdateCompanyD> createState() => _UpdateCompanyDState();
  
}
class _UpdateCompanyDState extends State<UpdateCompanyD> {
int view=0;
TextEditingController cname = TextEditingController(text: userobj4!.student[0].cname);
TextEditingController about = TextEditingController(text: userobj4!.student[0].about);
TextEditingController contactno = TextEditingController(text: userobj4!.student[0].contactno);

  @override
  void initState() {
  setState(() {
    getcompanyupdate(cid);
   
        //Navigator.pushNamed(context, "UpdateCompanyD");
  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateCompanyD()));
  });
    // TODO: implement initState
    super.initState();
 // getcompanydetailss();
   getupdatecomp();
   
  }

  getupdatecomp() async
  {

    //  getcompanyupdate(cid);
    //cname= userobj4!.student[0].name as TextEditingController;
    //about=  userobj4!.student[0].about as TextEditingController;
    setState(() {
      
      view=1;
    //  cid=hiringobj!.student[0].cid;
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Listcompany()));
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
                                             
                                             company(cid,cname.text, about.text, contactno.text);
                                             gethiringdetails(cid);
                                          //getcompany();
                                           //  cid=userobj3!.student[0].cid;
                                           //  inspect("here cid:"+cid);
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateCompanyH()));
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
  Future company(String cid,String cname,String about,String contactno) async {
    inspect(cname);
    inspect(about);
   // inspect(contactno);
  String purl = "https://codealphainfotech.com/luthara/lutharaapi.php?what=updatecompanydetails&cid=${cid}&cname=${cname}&about=${about}&contactno=${contactno}";
      //";
     var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);


  return pres.body;
  }
  //max id
 
}
/*var userobj4;
getcompanyupdate(String cid) async
{
  inspect("here in update:"+cid);
   String url="https://codealphainfotech.com/luthara/lutharaapi.php?what=getcompanyupdate&cid=${cid}";
  var res= await http.get(Uri.parse(url));
  if(res.statusCode==200)
  {
    userobj4=jsonDecode(res.body);

    return userobj4['student'];
  }
}*/

//Company hiring update

class UpdateCompanyH extends StatefulWidget {
  const UpdateCompanyH({ Key? key }) : super(key: key);

  @override
  State<UpdateCompanyH> createState() => _UpdateCompanyHState();
}

class _UpdateCompanyHState extends State<UpdateCompanyH> {

TextEditingController desioffer = TextEditingController(text:hiringobj!.student[0].desioffer);
TextEditingController roles = TextEditingController(text:hiringobj!.student[0].roles);
TextEditingController othrequirement = TextEditingController(text:hiringobj!.student[0].othrequirement);
TextEditingController department = TextEditingController(text:hiringobj!.student[0].department);
TextEditingController sector = TextEditingController(text:hiringobj!.student[0].sector);
TextEditingController location = TextEditingController(text:hiringobj!.student[0].location);
TextEditingController jdate = TextEditingController(text:hiringobj!.student[0].jdate);
TextEditingController status = TextEditingController(text:hiringobj!.student[0].status);


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
   gethiringdetails(cid);
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateCompanyD()));
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
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Listcompany()));
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
  String purl = url+"?what=updatecompanyhiringdetails&cid=${cid}&desioffer=${desioffer}&roles=${roles}&othrequirement=${othrequirement}&department=${department}&sector=${sector}&location=${location}&jdate=${jdate}&status=${status}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
  return pres.body;
  }
}

