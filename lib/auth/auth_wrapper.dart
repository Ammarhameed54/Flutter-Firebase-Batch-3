import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/admin/admin_home.dart';
import 'package:flutter_application_3/admin/user_home.dart';
import 'package:flutter_application_3/auth/views/login.dart';
import 'package:flutter_application_3/pages/home/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

   

        // Check if already Logged in

        if (snapshot.hasData && snapshot.data != null) {
          // Fetch USer id
               final user = snapshot.data!.uid;

          return FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(user)
                .get(),
            builder: (context, usersnapshot) {
              if (usersnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              // Fetch Role

              final role = usersnapshot.data!.get('role') ?? "user";

              if (role == "admin") {
                return AdminHome();
              } else {
                return UserHome();
              }

            
            },
          );
        }

        return Login();
      },
    );
  }
}
