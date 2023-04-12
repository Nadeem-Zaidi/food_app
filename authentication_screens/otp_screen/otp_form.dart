import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/authentication_bloc/user_authentication_bloc.dart';

import 'package:mobile_authentication/my_widgets/customtext.dart';
import 'package:mobile_authentication/my_widgets/my_custom_textfield.dart';
import 'package:mobile_authentication/reusable_widgets/mcontainer.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    print("-------------");
    print(otpController.text);
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserAuthenticationBloc bloc =
        BlocProvider.of<UserAuthenticationBloc>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const CustomText(
            text: "Verify OTP",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          CustomTextFormField(
            controller: otpController,
            labelText: "Enter OTP",
            radius: 10,
            enabledBorderColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          MContainer(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _submit();
                bloc.add(SendOTP(otp: otpController.text.trim()));
              },
              child: const CustomText(
                text: "Verify Phone",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
