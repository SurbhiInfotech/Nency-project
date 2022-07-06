import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:placement/coupstudworkexpdetails.dart';

enum SingingCharacter { Fullday , Halfday }

class UpStudOrgD extends StatefulWidget {
  const UpStudOrgD({ Key? key }) : super(key: key);

  @override
  _UpStudOrgDState createState() => _UpStudOrgDState();
}

class _UpStudOrgDState extends State<UpStudOrgD> {
  SingingCharacter? _characterss = SingingCharacter.Fullday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Student Organization Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudentWorkExp()));
          },
        ),
      ),
      body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.2)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Working Month',
                                  hintText: 'Enter working month'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Salary',
                                  hintText: 'Enter salary'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'OrganizationcName',
                                  hintText: 'Enter organization name'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Organization Designation',
                                  hintText: 'Enter organization designation'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                              child: const Text("Shift Time"),
                            ),
                            ListTile(
                            title: const Text('Full Day'),
                            leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Fullday,
                            groupValue: _characterss,
                            onChanged: (SingingCharacter? value) {
                            setState(() {
                                _characterss = value;
                              });
                            },
                          ),
                          ),
                          ListTile(
                              title: const Text('Half Day'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.Halfday,
                                groupValue: _characterss,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _characterss = value;
                                  });
                                },
                              ),
                            ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudent()));
                                           }, 
                                           child: 
                                           Text("Save",style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                            ),),
                                           style: OutlinedButton.styleFrom(
                                             padding: EdgeInsets.only(left:120,right: 120,top: 15,bottom: 15),
                                             backgroundColor: Color.fromRGBO(162, 29, 65, 1.0),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(120)),
                                             )
                                           )
                                           ),
                                SizedBox(height: 15,),
                        ],
                      ),
                ),
                    ],
                  ),
          ),
              ],
            ),
        )
      );
  }
}