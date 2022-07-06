import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/rendering.dart';
import 'package:placement/companyapi.dart';
import 'package:placement/main.dart';
import 'package:placement/studapply.dart';
import 'package:http/http.dart' as http;

class Companydisplay extends StatefulWidget {
  const Companydisplay({ Key? key }) : super(key: key);

  @override
  _CompanydisplayState createState() => _CompanydisplayState();
}

class _CompanydisplayState extends State<Companydisplay> {
int view=0;
 @override

  void initState() {
    // TODO: implement initState
    super.initState();
  
    getcompanydis();
  }

  getcompanydis() async
  {
    inspect("krishna");
   // userobj2= await gettendetails("1");
    //inspect(userobj2);
    setState(() {
      view=1;
    });
  }




@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Registered Company', style: TextStyle(color: Colors.black),),
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
              Text("Register Company", style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            //for(int i=0;i<=userobj3!.student[0].cid.length;i++)
            
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              
              leading: Icon(Icons.people_outline_outlined),
              title: Text(userobj3!.student[0].cid,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Passing Year",style: TextStyle(color: Colors.grey[600]),),
            ),
            
            ],
          )
          ),
       )
 
    ); 
    
  }
getcompanydisplay() async
{
  //var cid=userobj3!.student[0].cid;
  inspect("hi in function");
  
  String urls=url+"?what=getcompanydisplay";
  var res= await http.get(Uri.parse(urls));
  if(res.statusCode==200)
  {
   var compdis=studentFromJson(res.body);
   inspect(compdis);
    return compdis;
    
    var cid=userobj3!.student[0].cid;
    inspect("hello");

  //inspect(userobj3);
  }
}  
  

}
