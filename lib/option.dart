import 'package:flutter/material.dart';
import 'package:placement/cohome.dart';
import 'package:placement/login.dart';
import 'package:placement/main.dart';
import 'package:placement/cologin.dart';

class Option extends StatefulWidget {
  const Option({ Key? key }) : super(key: key);

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
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
                          const Text('Login as a,',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          
                          const Text('Please Login to Account',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CoLogin()));
                                  },
                                    child: const Text('Co-Ordinater Login',
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  },
                                    child: const Text('Student Login',
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
                         
                          GestureDetector(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MemberLogin()));
                                  },
                                  child:  const Text('T&p Member',
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