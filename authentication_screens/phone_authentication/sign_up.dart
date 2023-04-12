import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/authentication_bloc/user_authentication_bloc.dart';
import 'package:mobile_authentication/authentication_screens/otp_screen/otp_screen.dart';

import 'package:mobile_authentication/authentication_screens/phone_authentication/phone_signin_form.dart';
import 'package:mobile_authentication/authentication_screens/phone_authentication/phone_signup_form.dart';

import 'package:mobile_authentication/helper_screen/phone_loading_screen.dart';
import 'package:mobile_authentication/reusable_widgets/mcontainer.dart';

import '../../config/sizeconfig.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? singInError;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    UserAuthenticationBloc bloc =
        BlocProvider.of<UserAuthenticationBloc>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Positioned(
            top: 200,
            bottom: 20,
            left: 10,
            right: 10,
            child: SingleChildScrollView(
              child: PhoneSignUpForm(),
            ),
          ),
          BlocConsumer<UserAuthenticationBloc, UserAuthenticationState>(
            listener: ((context, state) {
              if (state is PhoneAuthError) {
                singInError = "some thing went wrong";
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'Some thing went wrong please try after some time')));
              } else if (state is PhoneAuthCodeSentSuccess) {
                Navigator.pushNamed(context, "/otpScreen");
              } else if (state is PhoneAuthVerified) {
                Navigator.pushReplacementNamed(context, "/home");
              }
            }),
            builder: (context, state) {
              if (state is PhoneLoadingState) {
                return PhoneLoadingScreen();
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
