import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';
import 'package:placement/studentapi.dart';

class UpStuentExtraAchive extends StatefulWidget {
  const UpStuentExtraAchive({ Key? key }) : super(key: key);

  @override
  State<UpStuentExtraAchive> createState() => _UpStuentExtraAchiveState();
}

class _UpStuentExtraAchiveState extends State<UpStuentExtraAchive> {
  TextEditingController  exactivity= TextEditingController();
  TextEditingController  specificachieve= TextEditingController();
  TextEditingController  message= TextEditingController();
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


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Extra Achievement Details",style: TextStyle(color: Colors.black),),
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
                              controller: exactivity,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Extra Activity',
                                  hintText: 'Enter extra activity'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: specificachieve,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Specific Achieve',
                                  hintText: 'Enter specific achieve'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: message,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Message',
                                  hintText: 'Enter message'),
                              ),
                          ),
                          
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                             var sid=userobj!.student[0].sid;
                                             
                                              inspect(sid);
                                             
                                             extraachievement(sid,exactivity.text,specificachieve.text,message.text);
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudent()));
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
   Future extraachievement(String sid,String exactivity,String specificachieve,String message) async {
  String purl = url+"?what=studextraachievement&sid=${sid}&exactivity=${exactivity}&specificachieve=${specificachieve}&message=${message}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }
}