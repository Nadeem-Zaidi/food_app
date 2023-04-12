import 'package:flutter/material.dart';
import 'package:mobile_authentication/authentication_screens/otp_screen/otp_screen.dart';
import 'package:mobile_authentication/authentication_screens/phone_authentication/phone_signin_form.dart';
import 'package:mobile_authentication/error_page/default_page_error.dart';
import 'package:mobile_authentication/screens/home.dart';
import 'package:mobile_authentication/screens/settings/settings.dart';

import '../authentication_screens/phone_authentication/sign_in.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/otpScreen':
        return MaterialPageRoute(builder: (_) => OTPScreen());
      case "/settings":
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(builder: (_) => DefaultPageError());
    }
  }
}
