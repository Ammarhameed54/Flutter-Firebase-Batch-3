import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/services/auth_service.dart';
import 'package:flutter_application_3/auth/views/forgot_password.dart';
import 'package:flutter_application_3/auth/views/sign_up.dart';
import 'package:flutter_application_3/auth/widgets/custom_button.dart';
import 'package:flutter_application_3/auth/widgets/custom_textform_field.dart';
import 'package:flutter_application_3/pages/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //

  final key = GlobalKey<FormState>();

  //

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  "Welcome Login to Continue",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),

              //
              SizedBox(height: 50),

              CustomTextformField(
                controller: emailController,
                prefixIcon: Icon(Icons.mail),
                hintText: "Enter Your Mail",
                label: "Email",
              ),

              // PAsswoed Field
              CustomTextformField(
                prefixIcon: Icon(Icons.lock_open),
                hintText: "Enter Your Password",
                label: "Password",
                controller: passwordController,
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                    child: Text("Forget Password"),
                  ),
                ],
              ),

              //
              SizedBox(height: 20),

              CustomButton(
                onTap: () async {
                  await authService
                      .login(emailController.text, passwordController.text)
                      .then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        ),
                      );
                },
                label: "Login",
              ),

              SizedBox(height: 20),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),


              IconButton(onPressed: () async{
                await authService.signInwithGoogle();
                
              }, icon: Icon(Icons.golf_course)),

              //
              TextButton(
                onPressed: () {
                  authService.signInAnonymously().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    ),
                  );
                },
                child: Text("Guest User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
