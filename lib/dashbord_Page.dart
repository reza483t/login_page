import 'dart:html';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/main.dart';

class dashbord_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = window.localStorage['tokensave'];
    var length = data?.length;
    if (length == null) {
      context.go("/");
    } else {
      debugPrint("Login page");
    }
    return Scaffold(
        appBar: AppBar(title: Text("Dashbord_Page")),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.orange.shade900,
            Colors.orange.shade600,
            Colors.orange.shade400,
          ])),
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onSurface: Colors.red,
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                window.localStorage.clear();
                var data = window.localStorage['tokensave'];
                var length = data?.length;
                if (length == null) {
                  context.go("/");
                } else { 
                  debugPrint("Login page");
                }
              },
              child: Text(
                "clear local stroch",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ));
  }
}
