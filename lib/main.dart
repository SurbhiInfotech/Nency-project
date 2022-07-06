import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/api.dart';
import 'package:placement/companyapi.dart';
import 'package:placement/companydisplay.dart';
import 'package:placement/coupcdetails.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/onboarding.dart';
import 'package:placement/studregester.dart';
import 'package:http/http.dart' as http;
import 'package:placement/option.dart';
import 'package:placement/studapply.dart';
import 'package:placement/login.dart';
import 'package:placement/studentviewoption.dart';
import 'package:placement/studhome.dart';
import 'package:placement/studregester.dart';
import 'package:placement/studprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
var eid;
String url="http://luthara.codealphainfotech.com/lutharaapi.php";


Future <void>  main() async{
WidgetsFlutterBinding.ensureInitialized();
  await initsp();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.purple
    ),
    debugShowCheckedModeBanner: false,
    home:  onb==1? Option():OnBoardingPage(),
    
  ));  
}

SharedPreferences? sp;
//Student? userobj;
int? onb;
initsp() async{
  sp = await SharedPreferences.getInstance();
  onb= sp!.getInt('onb');
}

class HomePage extends StatefulWidget {
  static const title = 'salomon_bottom_bar';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Rcompany(),
    UpStudent(),
    StudViewOption(),

  ];

 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          /* onTap: (i) => setState(() => 
          _currentIndex = i,), */

          onTap: (i) => {
            setState(() {
              _currentIndex = i;
              inspect(_currentIndex);
              if(i==1)
              {
              //inspect("In");
               // getcompanydetails();
                //getcompanydetailss();
                //getcompanydetails();
              getcompanydisplay();
                  //inspect("Hello Ji");
              }
              
            }),
            
          },
                   
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.app_registration_rounded),
              title: const Text("Apply"),
              selectedColor: Colors.pink,
            
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.message_outlined),
              title: const Text("Fill Details"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              title: const Text("Profile"),
              icon: const Icon(Icons.ac_unit,),
              selectedColor: Colors.teal,
            ),
          ],
      ),
    );
  }

}
