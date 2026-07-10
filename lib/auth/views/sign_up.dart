import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/services/auth_service.dart';
import 'package:flutter_application_3/auth/views/login.dart';
import 'package:flutter_application_3/auth/widgets/custom_button.dart';
import 'package:flutter_application_3/auth/widgets/custom_textform_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //

  final key = GlobalKey<FormState>();

  //

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //
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
                  "Welcome Sign Up to Continue",
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

              //
              SizedBox(height: 20),

              CustomButton(onTap: () async{
                 await  authService.signUp(
                    emailController.text,
                    passwordController.text,
                  );
                  emailController.clear();
                  passwordController.clear();
              }, label: "Sign Up"),

              SizedBox(height: 20,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Account "),
                  TextButton(onPressed: () {
                 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    
                  }, child: Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
