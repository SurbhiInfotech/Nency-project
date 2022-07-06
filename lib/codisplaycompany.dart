import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

import 'package:placement/cohome.dart';
import 'package:placement/loadCsvDataScreen.dart';
import 'package:placement/main.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/studenteditprofile.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/tendeatilsapi.dart';
import 'dart:io';
//import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
var cname;

//import 'file.dart';
var cid;
class Displaycompany extends StatefulWidget {
  const Displaycompany({ Key? key }) : super(key: key);

  @override
  State<Displaycompany> createState() => _DisplaycompanyState();
}

class _DisplaycompanyState extends State<Displaycompany> {
  
  
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
    var employeeObj= await getcompanydisplay();
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
        title:  const Text('Display Companys', style: TextStyle(color: Colors.black),),
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
                          child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              InkWell(
                                onTap:(){
                                  setState(() {
                                     cid=companydata[index]['cid'].toString();
                                     inspect("CID: "+cid);
                                    // gethiringdetails(cid);
                                    //inspect(cid);
                                  });
                                  //final String var_cid;
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Applystudentlist(cid)));
                                  //Navigator.push(context, MaterialPageRScreenArgumentsoute(builder: (context)=>Acompany(ScreenArguments(cid))));
                                  //Navigator.pushNamed(context, '/Acompany', arguments: (cid));
                                },
                              child:ListTile(
                              title:Text(companydata[index]['cname'].toString()),
                              
                             trailing: Text(companydata[index]['about'].toString()),
                             subtitle:Text(companydata[index]['contactno'].toString()),
                             
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

openFile() async
  {
    //File f = new File(filepath);
    print("CSV to List Here");
    //final input = f.openRead();
    //final fields = await input.transform(utf8.decoder).transform(new CsvToListConverter()).toList();
    //final fields = await rootBundle.loadString(filepath);
    //print(fields);
    setState(() {
      //employeeData=fields;
    });
 
    String urls=url+"?what=getcompanydetails";
    var res= await http.get(Uri.parse(urls));
    if(res.statusCode==200)
    {
      var employeeObjMain = jsonDecode(res.body);
      employeeObj = employeeObjMain['student'];
      //inspect(employeeObj.length);
      //userobj3=studentFromJson(res.body);
      //return userobj3;
      
    }
  }
    


    
    /* final _rawData = await rootBundle.loadString(filepath);
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      employeeData = _listData;
    }); */
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
      inspect(employeeObjMain);
      return employeeObjMain['student'];
      
    }

    //apply student list
    
}

class Applystudentlist extends StatefulWidget {
  const Applystudentlist(cid,{ Key? key }) : super(key: key);

  @override
  State<Applystudentlist> createState() => _ApplystudentlistState();
}

class _ApplystudentlistState extends State<Applystudentlist> {
  late String sid;
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
    //cid=userobj3!.student[0].cid;
    //getapplystudentdetails(cid);
    //inspect("hi");
    //var sid=userobj1!.student[0].sid;
    inspect("kri");
    var employeeObj= await getapplystudentdetails(cid);
   // inspect(employeeObj);
    
    companydata=employeeObj;
    inspect(companydata);
    companycount=companydata.length;
    inspect(companycount);
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
        title:  const Text('Display Apply Student List', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Displaycompany()));
          },
        ),
      ),
      body: //view==0 ? CircularProgressIndicator() : 
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          height: 3000,
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
                      Text("Students", style: TextStyle(
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
                                   //  cid=companydata[index]['cid'].toString();
                                     //inspect("CID: "+cid);
                                    // gethiringdetails(cid);
                                    //inspect(cid);
                                  });
                                  //final String var_cid;
                                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Acompany(cid)));
                                  //Navigator.push(context, MaterialPageRScreenArgumentsoute(builder: (context)=>Acompany(ScreenArguments(cid))));
                                  //Navigator.pushNamed(context, '/Acompany', arguments: (cid));
                                },
                              child:ListTile(
                                
                              title:Text(companydata[index]['enrollno'].toString(),
                              
                              ),
                               subtitle:Text(companydata[index]['email'].toString()),
                                
                             trailing:Row(
                               
                               mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(companydata[index]['status'].toString()),
                                    IconButton(onPressed: () {
                                       sid=companydata[index]['sid'];
                                      setState(() {
                                       
                                        var status="selected";
                                      statusupdate(sid,status);
                                       Navigator.pop(context); 
                                        //statusupdate(sid,status);
                                        inspect("selected");
                                      });
                                    }, icon: Icon(Icons.thumb_up)),
                                    IconButton(onPressed: () {
                                       sid=companydata[index]['sid'];
                                      setState(() {
                                        var status="not selected";
                                        statusupdate(sid,status);
                                        inspect("Not selected");
                                         Navigator.pop(context); 
                                      });
                                    }, icon: Icon(Icons.thumb_down)),
                                   // IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
                             ),
                              
                            
                              ),
                              
                              
                             ), 
                              //Text(companydata[index][2].toString()),
                            ],
                          ),
                        ),
                      );
                    }),
                    Column(
                      children: [
                        OutlinedButton(
                            onPressed: (){
                              
                              //generateCsv();
                              //downloadCsv();
                              sendEmail();
                            
                              showAlert(context);

                            },
                            child: Text('Download CSV File'),
                          ),
                        
                      ],
                    ),
                  ],
                  
                ),
          
          ),
       )
    )
    );
  }
  void showAlert(BuildContext context) {
                                        
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Text("download successfull"),
                                            ));
                                        }
Future sendemailcsv(String sid,String enrollno,) async {
    //inspect(cname);
   // inspect(about);
   // inspect(contactno);
  String purl = url+"?what=sendemailcsv&sid=${sid}&enrollno=${enrollno}";
      //";
     var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);


  return pres.body;
  }
  
  Future sendEmail() async {
    var compdata=companydata;
    //inspect(companydata);
    var sendurl = url+"?what=sendemail";
    final response = await http.post(
    Uri.parse(sendurl),
    headers: {
      //"Accept": "application/json",
      //'Content-Type': 'application/json; charset=UTF-8',
    },
    body: {"bdata": jsonEncode(companydata)},
  );

      inspect(response.body);
     // inspect("Data Sent");
  }

  
  /*generateCsv() async {
    //inspect(companydata);
  //print("in csv");
    
  
    /*Column(
      children: [
                    
                    
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
                                   //  cid=companydata[index]['cid'].toString();
                                     //inspect("CID: "+cid);
                                    // gethiringdetails(cid);
                                    //inspect(cid);
                                  });
                                  //final String var_cid;
                                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Acompany(cid)));
                                  //Navigator.push(context, MaterialPageRScreenArgumentsoute(builder: (context)=>Acompany(ScreenArguments(cid))));
                                  //Navigator.pushNamed(context, '/Acompany', arguments: (cid));
                                },
                                
                              child:ListTile(
                                
                              title:Text(companydata[index]['enrollno'].toString(),
                              
                              ),
                               subtitle:Text(companydata[index]['email'].toString()),
                                
                              
                            
                              ),
                              
                              
                             ), 
                              //Text(companydata[index][2].toString()),
                            ],
                            
                          ),
                        ),
                      );
                    }),
      ]
    );*/
                      /* List<List<String>> data = [
                        ["enrollno", "email", "Roll No."],
                        ["1", "P", "11"],
                        ["2", "J", "22"],
                      ]; */
                  //  inspect(companydata);
                      var compdata=companydata;
                      List<List<String>> data = [["enrollno", "email", "Roll No."],];
                      

                      int i;
                      //inspect(compdata);
                      for ( i = 0; i < compdata.length; i++) {
                        data.insert(i+1, [compdata[i]['enrollno'], compdata[i]['email'], compdata[i]['sid']]);
                      }
                       // return data;
                       // inspect(data);
                      String csvData = ListToCsvConverter().convert(data);
                      String directory = (await getApplicationSupportDirectory()).path;
                      String path = "$directory/myfile.csv";
                      File file = File(path);
                      await file.writeAsString(csvData);
                    //  await file.writeAsString(csvData,);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return LoadCsvDataScreen(path: path);
                          },
                        ),
                      );
                    }
*/
//----------------------------------------------
//this the code for download CSV File
//------------------------------------------------
/*void downloadCsv() async {
    int _counter = 0;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
   /* List<dynamic> associateList = [
      {"number": 1, "lat": "14.97534313396318", "lon": "101.22998536005622"},
      {"number": 2, "lat": "14.97534313396318", "lon": "101.22998536005622"},
      {"number": 3, "lat": "14.97534313396318", "lon": "101.22998536005622"},
      {"number": 4, "lat": "14.97534313396318", "lon": "101.22998536005622"}
    ];*/
    var compdata=companydata;
    List<List<String>> row = [["Enrollno", "Email","Interview","Status",],];
    int i;
    for ( i = 0; i < compdata.length; i++) {
      cname=compdata[i]['cname'];
      
      inspect(cname+':cname');
      row.insert(i+1, [compdata[i]['enrollno'], compdata[i]['email'], compdata[i]['interview'],compdata[i]['status']]);
    }
   /* List<List<dynamic>> rows = [];
    List<dynamic> row = [];
    row.add("number");
    row.add("latitude");
    row.add("longitude");
    rows.add(row);
    for (int i = 0; i < associateList.length; i++) {
      List<dynamic> row = [];
      row.add(associateList[i]["number"] - 1);
      row.add(associateList[i]["lat"]);
      row.add(associateList[i]["lon"]);
      rows.add(row);
    }*/
    String csv = const ListToCsvConverter().convert(row);
    String dir = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);
    inspect("dir $dir");
    String file = "$dir";
    String fname=cname;
    File f = File(file +"/"+fname+"_StudentsList.csv");
    f.writeAsString(csv);
    setState(() {
      _counter++;
    });



  /*  var compdata=companydata;
    List<List<String>> data = [["enrollno", "email", "Roll No."],];
    int i;
    for ( i = 0; i < compdata.length; i++) {
      data.insert(i+1, [compdata[i]['enrollno'], compdata[i]['email'], compdata[i]['sid']]);
    }
    String csvData = ListToCsvConverter().convert(data);
    String directory = (await getApplicationSupportDirectory()).path;
    String path = "$directory/myfile.csv";
    File file = File(path);
    await file.writeAsString(csvData);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(path: path);
        },
      ),
    ); */
  }*/

  getapplystudentdetails(String cid) async
{
  inspect("cid"+cid);
    String urls=url+"?what=getapplystudentdetails&cid=${cid}";
    var res= await http.get(Uri.parse(urls));
    if(res.statusCode==200)
    {
      var employeeObjMain = jsonDecode(res.body);
      //employeeObj = employeeObjMain['student'];
      //inspect(employeeObj.length);
      //userobj3=studentFromJson(res.body);
   //   inspect(employeeObjMain);
      return employeeObjMain['student'];
      
    }
}


Future statusupdate(String sid,String status) async {
  inspect("sid here:"+sid);
 // inspect("selectedoption:"+selectedoption);
  String purl = url+"?what=statusupdate&sid=${sid}&status=${status}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }

}


