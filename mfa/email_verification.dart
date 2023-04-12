import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_authentication/my_widgets/customtext.dart';

class VerifyEMail extends StatefulWidget {
  const VerifyEMail({super.key});

  @override
  State<VerifyEMail> createState() => _VerifyEMailState();
}

class _VerifyEMailState extends State<VerifyEMail> {
  final _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          CustomText(
            text: "Verify the email",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ]),
      ),
    );
  }
}
