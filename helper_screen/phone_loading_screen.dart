import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhoneLoadingScreen extends StatelessWidget {
  const PhoneLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
    ;
  }
}
