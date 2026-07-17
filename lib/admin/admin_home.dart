import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/auth_wrapper.dart';
import 'package:flutter_application_3/auth/services/auth_service.dart';
import 'package:flutter_application_3/auth/views/login.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          Center(child: Text("Admin Home")),

          ElevatedButton(
            onPressed: () async {
              await authService.logOut();
               Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,
              );
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
