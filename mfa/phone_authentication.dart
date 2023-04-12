import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_authentication/my_widgets/customtext.dart';

import '../my_widgets/my_custom_textfield.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({super.key});

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phone = TextEditingController();
  TextEditingController sms = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 200),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: phone,
                  labelText: "phone number",
                ),
                CustomTextFormField(
                  controller: sms,
                  labelText: "phone number",
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {},
                  child: CustomText(
                    text: "verify_phone",
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
