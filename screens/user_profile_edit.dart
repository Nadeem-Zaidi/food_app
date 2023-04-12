import 'package:flutter/material.dart';
import 'package:mobile_authentication/my_widgets/customtext.dart';
import 'package:mobile_authentication/my_widgets/my_custom_textfield.dart';

class UserProfileTextFormField extends StatefulWidget {
  String? labelText;
  Function? updateFunction;
  UserProfileTextFormField({super.key, this.labelText, this.updateFunction});

  @override
  State<UserProfileTextFormField> createState() =>
      _UserProfileTextFormFieldState();
}

class _UserProfileTextFormFieldState extends State<UserProfileTextFormField> {
  TextEditingController? controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    String content = controller!.text.trim();
    widget.updateFunction!(content);
  }

  bool showPrefixIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller,
                    labelText: widget.labelText,
                    suffixIcon: showPrefixIcon ? Icon(Icons.check) : null,
                    enableBorder: false,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              child: CustomText(
                text: "Updateee",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
