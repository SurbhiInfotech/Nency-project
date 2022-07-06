import 'package:flutter/material.dart';
import 'package:placement/cohome.dart';
import 'package:placement/coupcompanydetail.dart';

import 'package:placement/option.dart';


class UpCompany extends StatefulWidget {
  const UpCompany({ Key? key }) : super(key: key);

  @override
  State<UpCompany> createState() => _UpCompanyState();
}

class _UpCompanyState extends State<UpCompany> {
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CoHome()));
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
                                    Text('Upload Company Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 98)),
                                         OutlinedButton(
                                           onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCompanyD()));
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
                                    Text('Company Hiring Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                      ), 
                                    ),
                                    Row(
                                      children: [
                                         Padding(padding: EdgeInsets.only(right: 105)),
                                         OutlinedButton(
                                           onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpCompany()));
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