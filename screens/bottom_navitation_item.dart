import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavigationItem extends StatelessWidget {
  Widget icon;
  VoidCallback onPressed;

  BottomNavigationItem(
      {required this.onPressed, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
