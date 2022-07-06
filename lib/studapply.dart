import 'package:flutter/material.dart';
import 'package:placement/hiringapi.dart';
import 'package:placement/main.dart';
import 'package:placement/studentprofileapi.dart';
import 'package:placement/studregester.dart';
import 'dart:developer';
//late final String cid;
class Acompany extends StatefulWidget {
 // var cid;

  //var cid;
  //final String cid;
  const Acompany({ Key? key}) : super(key: key);
  
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
    hiringobj= await gethiringdetails(hiringobj!.student[0].cid);
    
    //inspect('HERE: ' + hiringobj!.student[0].cid);
    //userobj= await getuser();
    setState(() {
      view=1;
    });
  }




  
  int currindex=0;
  @override
  Widget build(BuildContext context) { 
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    inspect('Args: ' + args.cidval);

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
              trailing: Text("5 Position",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text(hiringobj!.student[0].roles,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("5 Position",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text(hiringobj!.student[0].othrequirement,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("5 Position",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.apartment),
              title: Text(hiringobj!.student[0].department,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("5 Position",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.apartment_sharp),
              title: Text(hiringobj!.student[0].sector,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("5 Position",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text(hiringobj!.student[0].location,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("5 Position",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text(hiringobj!.student[0].jdate,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("5 Position",style: TextStyle(color: Colors.grey[600]),),
            ),
            const SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>applycompany()));      
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
}

enum SingingCharacterss { Yes , No }

class applycompany extends StatefulWidget {
  const applycompany({ Key? key }) : super(key: key);

  @override
  _applycompanyState createState() => _applycompanyState();
}

class _applycompanyState extends State<applycompany> {
   SingingCharacterss? _characterss = SingingCharacterss.Yes;
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
         //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Acompany()));
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
              trailing: Text("Kruti Jetani",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.menu_rounded),
              title: Text("Company Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              trailing: Text("Successsoft Infotech Pvt.Ltd",style: TextStyle(color: Colors.grey[600]),),
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text("You want to give interview in company?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ), 
                ListTile(
                title: const Text('Yes'),
                leading: Radio<SingingCharacterss>(
                value: SingingCharacterss.Yes,
                groupValue: _characterss,
                onChanged: (SingingCharacterss? value) {
                setState(() {
                    _characterss = value;
                  });
                },
              ),
              ),
              ListTile(
                  title: const Text('No'),
                  leading: Radio<SingingCharacterss>(
                    value: SingingCharacterss.No,
                    groupValue: _characterss,
                    onChanged: (SingingCharacterss? value) {
                      setState(() {
                        _characterss = value;
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

class success extends StatefulWidget {
  const success({ Key? key }) : super(key: key);

  @override
  _successState createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/success.png'),
              Padding(padding: EdgeInsets.only(right: 20,left: 20)),
              Text("You have successfully added your schedule, You may check it on your schedule.",textAlign: TextAlign.center,textScaleFactor: 2,style: TextStyle(fontSize: 9.5,fontWeight: FontWeight.bold,),),
              SizedBox(height: 40,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Rcompany()));      
                                  },
                                  child:  const Text('Back',
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
          ),
        ),
      )
    );
  }
}