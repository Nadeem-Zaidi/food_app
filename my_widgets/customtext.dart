import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const CustomText(
      {this.text, this.fontSize, this.fontWeight, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
