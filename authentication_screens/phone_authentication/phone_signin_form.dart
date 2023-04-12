import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/authentication_bloc/user_authentication_bloc.dart';

import '../../my_widgets/customtext.dart';
import '../../my_widgets/my_custom_textfield.dart';
import '../../reusable_widgets/mcontainer.dart';

class PhoneSignInForm extends StatefulWidget {
  String? errorText;
  bool? err = false;
  PhoneSignInForm({this.errorText, this.err, super.key});

  @override
  State<PhoneSignInForm> createState() => _PhoneSignInFormState();
}

class _PhoneSignInFormState extends State<PhoneSignInForm> {
  TextEditingController phoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  void dispose() {
    phoneNumber.dispose();
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
          MContainer(),
          MContainer(
            child: const CustomText(
              text: "Sign In",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MContainer(
              width: 350,
              child: CustomTextFormField(
                controller: phoneNumber,
                labelText: 'Phone Number',
                prefixText: "+91",
                fontSize: 18,
                errorText: widget.errorText,
                err: widget.err ?? false,
                radius: 10,
                enabledBorderColor: Colors.grey.shade400,
              ),
            )
          ]),
          MContainer(
            marginTop: 30,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _submit();
                String phone = phoneNumber.text.trim();

                bloc.add(LoginEvent(phoneNumber: phone));
              },
              child: const CustomText(
                text: "Continue",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Dont have an account?",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/phoneSignUp");
                },
                child: const CustomText(
                  text: "Sing Up",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
