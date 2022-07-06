import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/login.dart';
import 'package:placement/studhome.dart';
import 'package:placement/main.dart';

class TnpHome extends StatefulWidget {
  const TnpHome({ Key? key }) : super(key: key);

  @override
  State<TnpHome> createState() => _TnpHomeState();
}

class _TnpHomeState extends State<TnpHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("T&p Member Home",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberLogin()));
          },
        ),
      ),
      body: Row(
         children: [Text("hi")],
                ),             
      )
            );

  }
}