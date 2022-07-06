import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:placement/edittendetails.dart';
import 'package:placement/main.dart';
//import 'package:placement/studentview10thdetails.dart';
//import 'package:placement/studentviewprofile.dart';
import 'package:placement/studentviewprofile.dart';
import 'package:placement/viewaddqualification.dart';
import 'package:placement/viewgraduation.dart';
import 'package:placement/viewinternship.dart';
import 'package:placement/viewpostgraduation.dart';
import 'package:placement/viewtendetails.dart';
import 'package:placement/tendeatilsapi.dart';
import 'package:placement/viewtwelvedetails.dart';
import 'package:placement/viewworkexp.dart';

class StudViewOption extends StatefulWidget {
  const StudViewOption({ Key? key }) : super(key: key);

  @override
  State<StudViewOption> createState() => _StudViewOptionState();
}


List classname = [
   MyProfile(),
  StudViewTenDetails(),
  StudViewTwelveDetails(),
  StudViewGraduation(),
  StudViewPostgraduation(),
  StudViewaddqualification(),
  StudViewWorkexp(),
  StudViewInternship(),
  //MyProfile(),
  //MyProfile(),
  //MyProfile(),
  //MyProfile()
];

List<String> uploaddata = [
  "View Personal Details",
  "View 10th Details",
  "View 12th Details",
  "View Graduation Details",
  "View Post Graduation Details",
  "View Add Qualification Details",
  "View Work Experance Details",
  "View SPI Details",
  //"View Extra Achievement Details"
];
List<IconData> icons = [
  Icons.person,
  Icons.book,
  Icons.book,
  Icons.ac_unit_sharp,
  Icons.dashboard_outlined,
  Icons.dashboard_outlined,
  Icons.dashboard_outlined,
  Icons.dashboard_outlined,
  Icons.dashboard_outlined
];
class _StudViewOptionState extends State<StudViewOption> {
  int currindex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title:  const Text('Student View Details', style: TextStyle(color: Colors.black),),
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
          child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 30),
        child: Container(
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height / 1.30,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20),
            itemCount: uploaddata.length ,
            shrinkWrap: true,
    
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    height: 250,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Icon(
                        icons[index],
                        size: 35,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromRGBO(162, 29, 65, 1.0),
                      ),
                    ),
                    left: 10,
                    top: 10,
                  ),
                  Positioned(
                    child: Container(
                      width: 140,
                      height: 80,
                      child: Text(
                        uploaddata[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    top: 80,
                    left: 15,
                  ),
                  Positioned(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => classname[index],
                              ));
                        },
                        icon: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(162, 29, 65, 1.0), 
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.white,
                          ),
                        )),
                    bottom: 10,
                    left: 60,
                  )
                ],
              );
            },
          ),
        ),
      )
      ),
        )
    );
  }
}