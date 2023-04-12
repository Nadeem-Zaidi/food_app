import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/authentication_bloc/user_authentication_bloc.dart';
import 'package:mobile_authentication/authentication_screens/otp_screen/otp_form.dart';

import 'package:mobile_authentication/helper_screen/phone_loading_screen.dart';
import 'package:mobile_authentication/reusable_widgets/mcontainer.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MContainer(),
          const Positioned(
            top: 200,
            left: 20,
            right: 20,
            bottom: 20,
            child: SingleChildScrollView(
              child: OTPForm(),
            ),
          ),
          BlocConsumer<UserAuthenticationBloc, UserAuthenticationState>(
            listener: ((context, state) {
              if (state is PhoneAuthError) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'Some thing went wrong please try after some time')));
              } else if (state is PhoneAuthCodeSentSuccess) {
                Navigator.pushNamed(context, "/otpScreen");
              } else if (state is PhoneAuthVerified) {
                Navigator.pushReplacementNamed(context, "/home");
              }
            }),
            builder: ((context, state) {
              if (state is PhoneLoadingState) {
                return PhoneLoadingScreen();
              }
              return Container();
            }),
          )
        ],
      ),
    );
  }
}
