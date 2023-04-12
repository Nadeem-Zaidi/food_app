import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/authentication_bloc/user_authentication_bloc.dart';

import 'package:mobile_authentication/authentication_screens/phone_authentication/phone_signin_form.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:mobile_authentication/helper_screen/phone_loading_screen.dart';

import '../../config/sizeconfig.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? singInError;
  bool isLoading = false;

  void checkUser() async {
    final HttpsCallable checkPhoneNumberExistence =
        FirebaseFunctions.instance.httpsCallable('checkPhoneNumberExistence');
    final result =
        await checkPhoneNumberExistence({'phoneNumber': '+917992482690'});

    if (result.data['exists']) {
      print('Phone number already exists in Firebase Auth');
    } else {
      print('Phone number does not exist in Firebase Auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUser();
    SizeConfig.init(context);
    UserAuthenticationBloc bloc =
        BlocProvider.of<UserAuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Stack(
        children: [
          Container(),
          Positioned(
            top: 200,
            bottom: 20,
            left: 10,
            right: 10,
            child: SingleChildScrollView(
              child: PhoneSignInForm(),
            ),
          ),
          BlocConsumer<UserAuthenticationBloc, UserAuthenticationState>(
            listener: ((context, state) {
              if (state is PhoneAuthError) {
                singInError = "some thing went wrong";
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Some thing went wrong please try after some time'),
                  ),
                );
              } else if (state is PhoneAuthCodeSentSuccess) {
                Navigator.pushNamed(context, "/otpScreen");
              } else if (state is PhoneAuthVerified) {
                Navigator.of(context).pushReplacementNamed("/home");
              }
            }),
            builder: (context, state) {
              if (state is PhoneLoadingState) {
                return PhoneLoadingScreen();
              }
              return Container(
                child: Center(),
              );
            },
          ),
        ],
      ),
    );
  }
}
