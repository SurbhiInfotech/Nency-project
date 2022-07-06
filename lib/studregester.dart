import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:placement/applyapi.dart';
import 'package:placement/studapply.dart';
import 'package:placement/hiringapi.dart';
import 'package:placement/main.dart';
import 'package:placement/sql.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';

import 'package:placement/studhome.dart';

import 'companyapi.dart';
late String cid;
class Rcompany extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RcompanyState();
  }

}



class RcompanyState extends State<Rcompany>{
  
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

  List<PlatformFile>? _paths;
  String? _extension="csv";
  FileType _pickingType = FileType.custom;
  /*void initState() {
    // TODO: implement initState
    super.initState();
    employeeData  = List<List<dynamic>>.empty(growable: true);
  }*/
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
           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
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
                                     gethiringdetails(cid);
                                    //inspect(cid);
                                  });
                                  //final String var_cid;
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Acompany(cid)));
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
                    }
                    ),
                  ],
                ),
        ),
      ),
  ),         
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

    


    
    /* final _rawData = await rootBundle.loadString(filepath);
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      employeeData = _listData;
    }); */
  }

  
  void _openFileExplorer() async {

    /* try {

      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    } */
    if (!mounted) return;
    setState(() {
      //openFile(_paths![0].path);
      openFile();
      //print('Hello');
      //print(_paths);
      //print("File path ${_paths![0]}");
      //print(_paths!.first.extension);

    });
  }
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

Future insertcsv(String eid,String email,String password) async {
  String purl = url+"?what=insertcsv&eid=${eid}&email=${email}&password=${password}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});  
  //inspect(pres.body);
  return pres.body;
} 

//Display Company:

class Acompany extends StatefulWidget {
 // var cid;

  //var cid;
  //final String cid;
  const Acompany(cid,{ Key? key}) : super(key: key);
  
  @override
  _AcompanyState createState() => _AcompanyState();
}

class ScreenArguments {
  final String cidval;
  ScreenArguments(this.cidval);
}



class _AcompanyState extends State<Acompany> {

int view=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gethiringdata();
  }

  gethiringdata() async
  {
    //var cidval;
    //inspect(cidval);
    //inspect("hi");
    //var sid=userobj1!.student[0].sid;
    hiringobj= await gethiringdetails(cid);
    
    //inspect('HERE: ' + hiringobj!.student[0].cid);
    //userobj= await getuser();
    setState(() {
      view=1;
    });
  }




  
  int currindex=0;
  @override
  Widget build(BuildContext context) { 
   // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    //inspect('Args: ' + args.cidval);

    return Scaffold(
      appBar: AppBar(
        title:  const Text('Apply Company', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Rcompany()));
          },
        ),
      ),
      body:view==0 ? CircularProgressIndicator() : SingleChildScrollView(
        
        child: Container(
          margin: EdgeInsets.all(20),
          height: 700,
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
              Text(hiringobj!.student[0].cname, style: TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(162, 29, 65, 1.0)
            ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.people_outline_outlined),
              title: Text(hiringobj!.student[0].desioffer,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Designation Offer",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text(hiringobj!.student[0].roles,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Roles",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text(hiringobj!.student[0].othrequirement,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Other Requirement",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.apartment),
              title: Text(hiringobj!.student[0].department,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Department",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.apartment_sharp),
              title: Text(hiringobj!.student[0].sector,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Sector",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text(hiringobj!.student[0].location,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Location",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(hiringobj!.student[0].jdate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Join Date",style: TextStyle(color: Colors.grey[600]),),
            ),
           
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: ()async{
                                    var sid = userobj!.student[0].sid;
                                  bool   flg=await checkmaxcompany(sid);
                                  
                                    inspect("flg"+flg.toString());
                                    if(flg==true)
                                    {
                                      String mess ="error";
                                      setState(() {
                                        showAlert(context);
                                      });
                                       
    
                                        inspect("in");
                                    }
                                    else
                                    {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>applycompany()));      
                                    }
                                  },
                                  child:  const Text('Apply',
                                  
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
  void showAlert(BuildContext context) {
                                        
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Text("You Have Already Selected in 2 Companies"),
                                            ));
                                        }
  checkmaxcompany(String sid) async {
 inspect("selectedoption:");
  String urls = url+"?what=checkmaxcompany&sid=${sid}";
  var res= await http.get(Uri.parse(urls));
    if(res.statusCode==200)
    {
      
      var cnt = jsonDecode(res.body);
      //employeeObj = employeeObjMain['student'];
      //inspect(employeeObj.length);
      //userobj3=studentFromJson(res.body);
      inspect(cnt);
     bool flg = false;
  if(cnt>=2)
  {
    flg = true;
  }
   return flg;
      
      //";
  /*var chk=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
  //inspect('CHK');
  int cnt = int.parse(chk.body);
  bool flg = false;
  if(cnt>=2)
  {
    flg = true;
  }
   return flg;*/
    }
  }
}

//Apply in Company:

enum SingingCharacterss { Yes , No }
//String _selectedGender;
class applycompany extends StatefulWidget {
  const applycompany({ Key? key }) : super(key: key);

  @override
  _applycompanyState createState() => _applycompanyState();
}

class _applycompanyState extends State<applycompany> {
   SingingCharacterss? _characterss = SingingCharacterss.Yes;
String interview="";
String status="Not Selected";
int view=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gethiringdata();
  }

  gethiringdata() async
  {
    //var cidval;
    //inspect(cidval);
   // inspect("hi in");
   // var sid=userobj1!.student[0].sid;
   // inspect(sid);
    hiringobj= await gethiringdetails(cid);
    
   // inspect('HERE: ' + userobj!.student[0].sid);
   // userobj= await getuser(e.toString());
   // inspect(userobj);
    setState(() {
      view=1;
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  const Text('Apply Company', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Acompany(cid)));
          },
        ),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          height: 500,
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
            ListTile(
              leading: Icon(Icons.person_outlined),
              title: Text("Student Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("hh",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text("Company Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text(hiringobj!.student[0].cname,style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("You want to give interview in company?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ), 
                ListTile(
                title:  Text('Yes'),
                leading: Radio<String>(
                value: "Yes",
                groupValue: interview,

                onChanged: (value) {
                setState(() {
                  interview = value!;
                    //_characterss = value;
                    inspect(interview);
                  });
                },
              ),
              ),
              ListTile(
                  title:  Text('No'),
                  leading: Radio<String>(
                    value: "No",
                    groupValue: interview,
                    onChanged: (value) {
                      setState(() {
                        interview = value!;
                        inspect(interview);
                      });
                    },
                  ),
                ),
              const SizedBox(height: 40,),
                          GestureDetector(
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 20),),
                                Container(
                                  child: InkWell(
                                      onTap: (){
                               //         Navigator.push(context, MaterialPageRoute(builder: (context)=>Acompany()));      
                                      },
                                      child:  const Text('Cancel',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    ),
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white
                                     ), 
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 10),),
                              Container(
                                  child: InkWell(
                                      onTap: (){
                                        //getstudentdetails(sid);
                                        var cid=hiringobj!.student[0].cid;
                                        inspect("hid:"+cid);
                                     //  getdataapply(sid);
                                        var sid=userobj!.student[0].sid;
                                        inspect("sid:"+sid);
                                        applyincompany(cid, sid, interview.toString(),status);

                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>success()));      
                                      },
                                      child:  const Text('Confirm',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    ),
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromRGBO(162, 29, 65, 1.0)
                                     ), 
                                    ),
                              ],
                            ),
                            ),
            ],
          )
          ),
       )
        );
  }
}
Future applyincompany(String cid,String sid,String interview,String status) async {
 // inspect("selectedoption:"+selectedoption);
  String purl = url+"?what=applyincompany&cid=${cid}&sid=${sid}&interview=${interview}&status=${status}";
      //";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
 // inspect(pres);
 
  }

