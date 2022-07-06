import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:placement/companyapi.dart';
import 'package:placement/login.dart';
import 'package:placement/main.dart';
import 'package:placement/option.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/studentviewselection.dart';
import 'package:placement/studregester.dart';
import 'package:placement/studviewapplycompany.dart';
import 'package:placement/updatepassword.dart';
import 'package:placement/viewcompanyselection.dart';
//import 'package:placement/studregester.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var companydata;
  var companycount=0;
int view=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 // getcompanydetailss();
   getcomp();
   //getstudentdetail();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              userobj!.student[0].email,
                            
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              userobj!.student[0].enrollno,
                             
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.upload,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Upload Details",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.format_align_center,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'View Details',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.login_rounded,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Option()));
              },
            ),
          ],
        ),
      ),
        
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
          title: Text("Dashboard",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
         /*   ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child:Image.asset(
                    'assets/images/banner2.png',
                    fit: BoxFit.cover,
                  ),
                  ),
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child:Image.asset(
                    'assets/images/banner2.png',
                    fit: BoxFit.cover,
                  ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                    'assets/images/banner3.png',
                    fit: BoxFit.cover,
                  ),
                  ),
                ],
                onPageChanged: (value) {
                  print('Page changed: $value');
                },
                autoPlayInterval: 3000,
                isLoop: true,
              ),*/
          SizedBox(
            height: 20,
            
          ),
         Row(
           children: [ 
             Padding(padding: EdgeInsets.only(left: 5,top: 20),),
                 GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange.shade300,
                              
                              boxShadow:[ 
                                BoxShadow(
                                    color: 
                                    Colors.grey.withOpacity(0.2), 
                                    
                                    spreadRadius: 3, 
                                    blurRadius: 7, 
                                    offset: Offset(0, 2), 
                                ),
                                ],
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Studviewapplycom()));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('View Applied Companies',
                                textAlign: TextAlign.center,
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
                        SizedBox(
                          width: 25,
                        ),
          Padding(padding: EdgeInsets.only(left: 20,top: 20),),
                 GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.teal.shade600,
                              boxShadow:[ 
                                BoxShadow(
                                    color: 
                                    Colors.grey.withOpacity(0.2), 
                                    spreadRadius: 3, 
                                    blurRadius: 7, 
                                    offset: Offset(0, 2), 
                                ),
                                ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text("Total Companies:  "+companycount.toString(),
                              textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              ),

                              
                          ),
                        ),
                        
                      ],
                      ),
                       SizedBox(height: 20,),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5,top: 20),),
                 GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red.shade300,
                              boxShadow:[ 
                                BoxShadow(
                                    color:
                                    Colors.grey.withOpacity(0.5), 
                                    spreadRadius: 3, 
                                    blurRadius: 7, 
                                    offset: Offset(0, 2), 
                                ),
                                ],
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Updatepassword()));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Change Password',
                                textAlign: TextAlign.center,
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
                        SizedBox(
                          width: 25,
                        ),
                      Padding(padding: EdgeInsets.only(left: 20,top: 20),),
                 GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.purple.shade100,
                              boxShadow:[ 
                                BoxShadow(
                                    color: 
                                    Colors.grey.withOpacity(0.2), 
                                    spreadRadius: 3, 
                                    blurRadius: 7, 
                                    offset: Offset(0, 2), 
                                ),
                                ],
                            ),
                            child: 
                            InkWell(
                               onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Studviewselection()));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("View Your Selection",
                                textAlign: TextAlign.center,
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
                       
                    SizedBox(height: 20,),
                    Row(
                          children: <Widget>[
                                  
                          Text("List of Companies",
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromRGBO(162, 29, 65, 1.0),
                            shadows: <Shadow>[
      /*Shadow(
        offset: Offset(10.0, 10.0),
        blurRadius: 0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),*/
    ],
                            //shadows: Color.fromRGBO(162, 29, 65, 1.0).withOpacity(0.2),
                          ),
                          ),  
                                
                         /*Expanded(
                         child: Divider(color: Colors.black,height: 50,)
        ),*/
        SizedBox(width: 160,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Rcompany()));
          },
          child: Text("View All",
           style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromRGBO(162, 29, 65, 1.0),
                          ),
          ),
        )
    ]
),
 //                   Divider(color: Colors.black,),
                   
                      SizedBox(height: 20,),
                      Expanded(child: ListView.separated(itemBuilder: (context,index){
                        
                        return Container(
                          
                                      height: 100,
                                      decoration: BoxDecoration(
                                        
                                       
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2,
                              color: Color.fromRGBO(162, 29, 65, 1.0)
                              ),
                               
                            ),
                                     // color: Color.fromRGBO(162, 29, 65, 1.0),
                                      child:  Center(
                                        child: ListTile(
                                          title:Text(companydata[index]['cname'].toString()),
                                          subtitle:Text(companydata[index]['about'].toString()),
                                        //  title: Text("Enter the number which you want to view all",textScaleFactor: 2,style: TextStyle(fontSize: 10,color: Colors.white),
                                         
                                          ),
                                          ),
                                          
                                      );
                      
                      }, separatorBuilder: (context,index){
                        return SizedBox(height: 10,);
                      }, itemCount: companycount),)   
                      ],
                      ),
                    ), 
                ),
            ); 
  }
  
  getcompanydisplay() async
{
 // inspect("jkk");
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
//student display

/*var studdisplay;
getstudentdetails(String sid) async
{
  //inspect('hello');
  var sid=userobj!.student[0].sid;
  //inspect("sid:"+userobj!.student[0].sid);
  String url="https://codealphainfotech.com/luthara/lutharaapi.php?what=getstudentprofile&sid=${sid}";
  var res= await http.get(Uri.parse(url));
  if(res.statusCode==200)
  {
    studdisplay=(res.body);
   inspect(studdisplay);
    return studdisplay;
    //inspect(userobj1);
  }

}*/
}