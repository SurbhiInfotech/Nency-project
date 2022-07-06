import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/coapi.dart';
import 'package:placement/cohome.dart';
import 'package:placement/main.dart';
import 'package:placement/tnphome.dart';


class CoLogin extends StatefulWidget {
  const CoLogin({ Key? key }) : super(key: key);

  @override
  _CoLoginState createState() => _CoLoginState();
}

class _CoLoginState extends State<CoLogin> {
int? _value;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
String valid="";
String? primaryerror;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.2), 
                  spreadRadius: 3, 
                  blurRadius: 10, 
                  offset: Offset(0, 2), 
               ),
              ],
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(50),
                    height: MediaQuery.of(context).size.height/1.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:[ 
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2), 
                              spreadRadius: 5, 
                              blurRadius: 20, 
                              offset: Offset(0, 2), 
                          ),
                     ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
                          const SizedBox(height: 10,),
                          const Text('Hello,',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Text('Please Login to Account',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                            ),
                          ),
                         // SizedBox(height: 10,),
                          Container(
                            width: 250,
                            child:  TextField(
                              controller: email,
                              decoration: InputDecoration(
                                labelText: 'email',
                                suffixIcon: Icon(Icons.email_outlined,size: 17,),
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            child:  TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                errorText: valid,
                                suffixIcon: Icon(Icons.remove_red_eye,size: 17,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 40, 20),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: (){},
                                child: const Text('Forgot Password?'),
                              )
                            ),
                            ),
                            const SizedBox(height: 10,),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(162, 29, 65, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    onTap: () async {
                                      
                                      userobj=await getcoodinatorlogin(email.text,password.text);
                                   
                                    if(userobj==null)
                                    {
                                      inspect("hi");
                                      valid="Invalid Login Credetials!";
                                      setState(() {
                                        valid="Invalid User!";
                                      
                                      });
                                      return;
                                    }

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CoHome()));
                                  },
                                    child: const Text('login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  ),
                                  ),
                              ),
                            ),
                         const SizedBox(height: 10,),
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){},
                                  child:  const Text('Restore',
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
                ),
              ],
            ),
          ),
      ),
    ),
    );
  }
}
