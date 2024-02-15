// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:login_page/dashbord_Page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  final TextEditingController Gmailtextfild = TextEditingController();
  final TextEditingController Passwordtextfild = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    var data = window.localStorage['tokensave'];
    var length = data?.length;
    debugPrint(length.toString());
     if(length!=0){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> dashbord_Page(),),);
    }else{
      debugPrint("Login page");
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange.shade900,
          Colors.orange.shade600,
          Colors.orange.shade400,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, 3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: TextField(
                                  controller: Gmailtextfild,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none)),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: TextField(
                                  controller: Passwordtextfild,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(50),
                        //   color: Colors.orange.shade900

                        child: Center(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onSurface: Colors.black,
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            sendData();
                            //               showDialog(
                            //             context: context,
                            //             builder: (BuildContext context) {
                            //               return AlertDialog(
                            //                 title: Text( Gmailtextfild.text),
                            //                 content: Text(Passwordtextfild.text),
                            //                 actions: <Widget>[
                            //                   TextButton(
                            //                     onPressed: () {
                            //                       Navigator.of(context).pop();
                            //                     },
                            //                     child: Text('ok'),
                            //                   ),
                            //                 ],
                            //               );
                            //             },
                            //           );
                          },
                          child: Text('Login'),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future sendData() async {
    var url = Uri.parse(
        "https://api.timez.ir/docs#/account/get_token_account_auth_token_post");
    Map<String, String> body = <String, String>{
      "username": Gmailtextfild.text,
      "password": Passwordtextfild.text,
    };
    var response = await http.post(url, body: body);
    var jsonOutput = json.decode(response.body);
    debugPrint("json output $jsonOutput ");
    window.localStorage['tokensave']=jsonOutput.toString();
    var data = window.localStorage['tokensave'];
    var length = data?.length;
    debugPrint(length.toString());
     if(length==28){
      debugPrint("wellcom to the new page");
    }else{
      debugPrint("Login page");
    }
  }
}
