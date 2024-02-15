import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/main.dart';

class dashbord_Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashbord_Page")),
      body: Container(  decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange.shade900,
          Colors.orange.shade600,
          Colors.orange.shade400,
        ]
        )
        ),
        
        ),
        
    );
  }
}
