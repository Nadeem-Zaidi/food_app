import 'package:flutter/material.dart';
import 'package:mobile_authentication/device_context/mobile.dart';

class CustomTextFormField extends FormField<String> {
  CustomTextFormField({
    Key? key,
    String? labelText,
    String? initialValue,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    AutovalidateMode? autovalidateMode,
    bool enabled = true,
    TextEditingController? controller,
    Function(String)? onChange,
    double radius = 20,
    String? errorText,
    bool obscure = false,
    Color? focusedBorderColor = Colors.black,
    Color? enabledBorderColor = Colors.black,
    Color? focussedErrorBorderColor = Colors.black,
    bool err = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    FocusNode? focus,
    double? fontSize = 18,
    bool readOnly = false,
    bool filled = false,
    Color? fillColor,
    String? prefixText,
    bool enableBorder = true,
  }) : super(
          key: key,
          initialValue: initialValue ?? '',
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          enabled: enabled,
          builder: (FormFieldState<String> field) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                controller: controller,
                onChanged: onChange,
                obscureText: obscure,
                focusNode: focus,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                readOnly: readOnly,
                initialValue: initialValue,

                decoration: InputDecoration(
                  fillColor: fillColor,
                  filled: filled,
                  labelText: labelText,
                  errorText: err ? errorText : null,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  prefixText: prefixText,
                  enabledBorder: enableBorder
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius),
                          borderSide:
                              BorderSide(width: 2, color: enabledBorderColor!),
                        )
                      : null,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide:
                        BorderSide(width: 2, color: focusedBorderColor!),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide:
                        BorderSide(width: 2, color: focussedErrorBorderColor!),
                  ),
                ),

                // You can add this property if you need a password input
              ),
            );
          },
        );
}
