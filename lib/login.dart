import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement/studentapi.dart';
import 'package:placement/cohome.dart';
import 'package:placement/main.dart';
import 'package:placement/tnphome.dart';
var email;
var password;
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 int view=0;
int? _value;
TextEditingController e = TextEditingController();
TextEditingController p = TextEditingController();
String valid="";
bool _validate = false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
    getlogin();
  }

  getlogin() async
  {
    email=userobj!.student[0].email;
    password=userobj!.student[0].password;
    inspect("hi");
    //var sid=userobj1!.student[0].sid;
    userobj= await getuserlogin(e.text,p.text);
    //inspect(userobj1);
    //userobj= await getuser();
    setState(() {
      view=1;
    });
  }




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
                              color: Colors.grey,
                              
                              
                            ),
                          ),
                         // SizedBox(height: 10,),
                          Container(
                            width: 250,
                            child: TextField(
                              
                              controller: e,
                              
                              decoration: InputDecoration(
                                labelText: 'email',
                               // label: Text(valid),
                               // errorText: userobj?.student[0].email == e.text ? 'email not match' : null,
                                suffixIcon: Icon(Icons.email_outlined,size: 17,),
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: TextField(
                              controller: p,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                errorText: valid,
                                
                                suffixIcon: Icon(Icons.remove_red_eye,size: 17,)
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
                                    onTap: ()async{
                                   
                                  getstudent=await getstudentdetails();
                                  //inspect(getstudent);
                                    userobj=await getuserlogin(e.text,p.text);
                                    if(userobj==null)
                                    {
                                      valid="Invalid Login Credetials!";
                                     
                                      setState(() {
                                        
                                         valid="Invalid User!";
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                      
                                       //inspect(valid);
                                        return;

                                        
                                      
                                      });
                                      return;
                                    }
                                    
                                    
                                     // valid="Invalid User";
                                     // inspect(valid);
                                      //getuser('tikiwalakrishna@gmail.com', '123').then((value) {});
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
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

String? validatePassword(String value) {
  if (userobj?.student[0].email== null)  {
    return "Password should contain more than 5 characters";
  }
  return null;
}


class MemberLogin extends StatefulWidget {
  const MemberLogin({ Key? key }) : super(key: key);

  @override
  State<MemberLogin> createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
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
                            child: const TextField(
                              decoration: InputDecoration(
                                labelText: 'email',
                                suffixIcon: Icon(Icons.email_outlined,size: 17,),
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
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
                                    onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TnpHome()));
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