import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/services/auth_service.dart';
import 'package:flutter_application_3/auth/views/sign_up.dart';
import 'package:flutter_application_3/auth/widgets/custom_button.dart';
import 'package:flutter_application_3/auth/widgets/custom_textform_field.dart';
import 'package:flutter_application_3/pages/home.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //

  final key = GlobalKey<FormState>();

  //

  final emailController = TextEditingController();


  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              Center(
                child: Text(
                  "Forget Your Password? Dont worry we will let you fix it",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),

              Text("Check Spam Folder"),

              //
              SizedBox(height: 50),

              CustomTextformField(
                controller: emailController,
                prefixIcon: Icon(Icons.mail),
                hintText: "Enter Your Mail to send reset Link",
                label: "Email",
              ),

             

              //
              SizedBox(height: 20),

              CustomButton(
                onTap: () async {
                await authService.resetPassword(emailController.text);
                },
                label: "Reset Password",
              ),

             
            ],
          ),
        ),
      ),
    );
  }
}
