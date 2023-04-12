import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/app_router/router.dart';
import 'package:mobile_authentication/authentication_bloc/auth_repository.dart';
import 'package:mobile_authentication/authentication_screens/otp_screen/otp_via_sign_up.dart';
import 'package:mobile_authentication/authentication_screens/phone_authentication/phone_signup_form.dart';
import 'package:mobile_authentication/authentication_screens/phone_authentication/sign_in.dart';
import 'package:mobile_authentication/authentication_screens/phone_authentication/sign_up.dart';
import 'package:mobile_authentication/bloc/page_navigation_bloc.dart';

import 'package:mobile_authentication/screens/home.dart';

import 'package:mobile_authentication/screens/user_profile_edit.dart';

import 'authentication_bloc/user_authentication_bloc.dart';
import 'authentication_screens/otp_screen/otp_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PhoneAuthRepository_ repository = PhoneAuthRepository_();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
      providers: [
        BlocProvider<UserAuthenticationBloc>(
          create: (BuildContext context) {
            return UserAuthenticationBloc(phoneAuthRepo: repository)
              ..add(CheckAuthenticationEvent());
          },
        ),
        BlocProvider<PageNavigationBloc>(
          create: (BuildContext context) {
            return PageNavigationBloc();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
