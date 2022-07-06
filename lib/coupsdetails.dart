import 'package:flutter/material.dart';
import 'package:placement/cohome.dart';
import 'package:placement/coupstudent10thdetail.dart';
import 'package:placement/coupstudent12thdetail.dart';
import 'package:placement/coupstudentadditionalqualification.dart';
import 'package:placement/coupstudentextraachievement.dart';
import 'package:placement/coupstudentgraddetail.dart';
import 'package:placement/coupstudentpesonaldetail.dart';
import 'package:placement/coupstudentpostgraduation.dart';
import 'package:placement/coupstudsuminterndetails.dart';
import 'package:placement/coupstudworkexpdetails.dart';
import 'package:placement/main.dart';

class UpStudent extends StatefulWidget {
  const UpStudent({ Key? key }) : super(key: key);

  @override
  _UpStudentState createState() => _UpStudentState();
}

class _UpStudentState extends State<UpStudent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Upload Student Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 108)),
                                         OutlinedButton(
                                           onPressed: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentD()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student PG Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 135)),
                                         
                                         OutlinedButton(
                                          
                                           onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentPostgraduation()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student Graduation Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 82)),
                                         OutlinedButton(
                                           onPressed: (){
                                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentGradD()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student 12th Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 125)),
                                         OutlinedButton(
                                           onPressed: (){
                                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentTweD()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student 10th Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 125)),
                                         OutlinedButton(
                                           onPressed: (){
                                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentTenD()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student Qualification Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 70)),
                                         OutlinedButton(
                                           onPressed: (){
                                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudAddQualification()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student Work Experiance Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 44)),
                                         OutlinedButton(
                                           onPressed: (){
                                           //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudWorkExpD()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student  Summer Internship Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 22)),
                                         OutlinedButton(
                                           onPressed: (){
                                           //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudSumInternD()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
          Container(
             padding: EdgeInsets.all(10),
            child: 
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(width: 0.2),
                            ),
                            child: 
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('Student Extra Achievement Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 30)),
                                         OutlinedButton(
                                           onPressed: (){
                                           //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStuentExtraAchive()));
                                           }, 
                                           child: 
                                           Icon(Icons.arrow_forward_ios,color: Colors.white,
                                           ),
                                           style: OutlinedButton.styleFrom(
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           )
                                        ],
                                    )
                                    
                                  ],
                                ),
                              ),
                              ),
                          ),
          ),
        ],
      ),
      ),
      )
      );
  }
}