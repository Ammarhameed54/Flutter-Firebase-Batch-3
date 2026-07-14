import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/services/auth_service.dart';
import 'package:flutter_application_3/auth/views/login.dart';
import 'package:flutter_application_3/pages/home/services/user_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    UserService userService = UserService();
    FirebaseAuth auth = FirebaseAuth.instance;
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

          Text(auth.currentUser!.email.toString()),
          
        ],
      ));
  }
}