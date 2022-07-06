import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import 'package:placement/cohome.dart';
import 'package:placement/main.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/studenteditprofile.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/studentapi.dart';
import 'package:http/http.dart' as http;

import 'studhome.dart';
var sid;


class Studviewselection extends StatefulWidget {
  const Studviewselection({ Key? key }) : super(key: key);

  @override
  State<Studviewselection> createState() => _StudviewselectionState();
}

class _StudviewselectionState extends State<Studviewselection> {
  
  late List<List<dynamic>> employeeData;
  var employeeObj;
  var companydata;
  var companycount=0;
  //var cid;
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
    var employeeObj= await getstudentapplydisplay(sid);
    inspect(employeeObj);
    
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




  /*int view=0;
  
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
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title:  const Text('Display Company', style: TextStyle(color: Colors.black),),
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
      body: //view==0 ? CircularProgressIndicator() : 
      SingleChildScrollView(
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
          child:  Column(
                  
                  children: [
                    Padding(padding: EdgeInsets.all(10),),
                      Text("You Selected In:", style: TextStyle(
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
                          child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    
                                  //   cid=companydata[index]['cid'].toString();
                                   //  inspect("CID: "+cid);
                                    // gethiringdetails(cid);
                                    //inspect(cid);
                                  });
                                  //final String var_cid;
                                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Applystudentlist(cid)));
                                  //Navigator.push(context, MaterialPageRScreenArgumentsoute(builder: (context)=>Acompany(ScreenArguments(cid))));
                                  //Navigator.pushNamed(context, '/Acompany', arguments: (cid));
                                },
                              child:ListTile(
                              title:Text(companydata[index]['cname'].toString()),
                             
                             //subtitle:Text(companydata[index]['contactno'].toString()),
                             
                              ),
                              
                              
                             ), 
                              //Text(companydata[index][2].toString()),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
          
          ),
       )
    )
    );
  }

  getstudentapplydisplay(String sid) async
{
  sid=userobj!.student[0].sid;
  //inspect("applyid:"+applyid);
    String urls=url+"?what=getstudentselection&sid=${sid}";
    var res= await http.get(Uri.parse(urls));
    if(res.statusCode==200)
    {
      var employeeObjMain = jsonDecode(res.body);
      //employeeObj = employeeObjMain['student'];
      //inspect(employeeObj.length);
      //userobj3=studentFromJson(res.body);
      inspect(employeeObjMain);
      return employeeObjMain['student'];
      
    }

    //apply student list
    
}

Future deleteapply(String applyid) async {
  
  inspect("apply here:"+applyid);
 // inspect("selectedoption:"+selectedoption);
  String purl = url+"?what=deleteapply&applyid=${applyid}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }
}