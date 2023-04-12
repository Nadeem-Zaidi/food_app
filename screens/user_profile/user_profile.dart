import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_authentication/my_widgets/customtext.dart';
import 'package:mobile_authentication/screens/user_profile/contact_information.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.grey.shade300,
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: CustomText(
                      text: "Nadeem Zaidi",
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                  CustomText(
                    text: "Ali Ganj Road number  1B",
                    fontSize: 18,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Contact Information",
                      ),
                    ],
                  ),
                  ContactInformation(
                    phoneNumber: "+917992482690",
                    email: "nadeem.zaidi@gmail.com",
                    emailVerified: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
