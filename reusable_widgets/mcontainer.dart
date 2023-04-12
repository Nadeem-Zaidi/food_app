import 'package:flutter/widgets.dart';

class MContainer extends Container {
  MContainer({
    Key? key,
    double? marginAll,
    double? marginTop,
    double? marginLeft,
    double? marginRight,
    double? marginBottom,
    double? width,
    double? height,
    double? radius,
    double? borderWidth,
    Color? color,
    Widget? child,
  }) : super(
          key: key,
          width: width,
          height: height,
          margin: marginAll != null
              ? EdgeInsets.all(marginAll)
              : EdgeInsets.only(
                  top: marginTop ?? 0,
                  left: marginLeft ?? 0,
                  right: marginRight ?? 0,
                  bottom: marginBottom ?? 0),
          decoration: BoxDecoration(
            borderRadius: radius != null ? BorderRadius.circular(radius) : null,
            border: borderWidth != null ? Border.all(width: borderWidth) : null,
            color: color,
          ),
          child: child,
        );
}
