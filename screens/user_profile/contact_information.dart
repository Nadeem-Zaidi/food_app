import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_authentication/my_widgets/customtext.dart';

class ContactInformation extends StatelessWidget {
  String? name;
  String? address;
  String phoneNumber;
  String email;
  bool emailVerified;
  ContactInformation(
      {required this.phoneNumber,
      required this.email,
      this.emailVerified = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.phone_android),
          title: CustomText(text: "Phone Number"),
          subtitle: CustomText(text: phoneNumber),
          trailing: Icon(
            Icons.verified,
            color: Colors.green,
          ),
        ),
        ListTile(
          leading: Icon(Icons.phone_android),
          title: CustomText(text: "Email"),
          subtitle: CustomText(text: email),
          trailing:
              emailVerified ? Icon(Icons.verified, color: Colors.green) : null,
        ),
        if (emailVerified == false)
          CustomText(
            text: "Your email is not verified.Please verify now",
          ),
      ]),
    );
  }
}

class Contact {
  String? name;
  String? address;
  String phoneNumber;
  String email;
  bool emailVerified;
  Contact(
      {this.name,
      this.address,
      required this.phoneNumber,
      required this.email,
      this.emailVerified = false});

  Widget getPhoneEmail() {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone_android),
            title: CustomText(text: "Phone Number"),
            subtitle: CustomText(text: phoneNumber),
            trailing: Icon(
              Icons.verified,
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: CustomText(text: "Email"),
            subtitle: CustomText(text: email),
            trailing: emailVerified
                ? Icon(Icons.verified, color: Colors.green)
                : null,
          ),
          if (emailVerified == false)
            CustomText(
              text: "Your email is not verified.Please verify now",
            ),
        ],
      ),
    );
  }
}
