import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/services/auth_service.dart';

import 'package:flutter_application_3/auth/views/login.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          Center(child: Text("User Home")),

          ElevatedButton(
           onPressed: () async {
              await authService.logOut().then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false,
                );
              });
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
