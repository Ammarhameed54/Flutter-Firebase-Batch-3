import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/services/auth_service.dart';
import 'package:flutter_application_3/auth/views/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () async{
            await authService.logOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),)),);
            
          }, icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.red,
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          Center(child: Text("Home", style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}