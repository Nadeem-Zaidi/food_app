import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_authentication/my_widgets/customtext.dart';
import 'package:mobile_authentication/my_widgets/my_custom_textfield.dart';

class EmailSignUP extends StatefulWidget {
  const EmailSignUP({super.key});

  @override
  State<EmailSignUP> createState() => _EmailSignUPState();
}

class _EmailSignUPState extends State<EmailSignUP> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var mu = FirebaseAuth.instance.currentUser;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(mu);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 200),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: emailController,
                  labelText: "Email address",
                ),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: "Email address",
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    var u = (await _auth.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    ))
                        .user;
                  },
                  child: CustomText(
                    text: "Sign Up",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
