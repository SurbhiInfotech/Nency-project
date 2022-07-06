import 'package:flutter/material.dart';
import 'package:placement/coupsdetails.dart';
import 'package:http/http.dart' as http;
import 'package:placement/main.dart';


class UpStudentAdd extends StatefulWidget {
  const UpStudentAdd({ Key? key }) : super(key: key);

  @override
  State<UpStudentAdd> createState() => _UpStudentAddState();
}

class _UpStudentAddState extends State<UpStudentAdd> {
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController addtype = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student Address Details",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpStudent()));
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
                              controller: city,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'City',
                                  hintText: 'Enter city'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            
                            child: TextFormField(
                              controller: state,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'State',
                                  hintText: 'Enter state'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: pincode,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Pincode',
                                  hintText: 'Enter pincode'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: addtype,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Address Type',
                                  hintText: 'Enter address type'),
                              ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: address,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Address',
                                  hintText: 'Enter address'),
                              ),
                          ),
                          SizedBox(height: 15,),
                          OutlinedButton(
                                           onPressed: (){
                                            studaddress(city.text,state.text,pincode.text,addtype.text,address.text);
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
      )
    );
  }
}
  Future studaddress(String city,String state,String pincode,String addtype,String address) async {
  String purl =
      url+"?what=studentaddress&city=${city}&state=${state}&pincode=${pincode}&addtype=${addtype}&address=${address}";
  var pres=await http.post(Uri.parse(purl), headers: {"Accept": "application/json"});
}