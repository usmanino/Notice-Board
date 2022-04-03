import 'package:flutter/material.dart';
 import 'package:noticeboard_system/core/styles.dart';

class SolidButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final GestureTapCallback onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double elevation;
  final double radius;
  final BorderSide border;
  final IconData? icon;

  const SolidButton({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.color,
    this.icon,
    this.width = double.infinity,
    this.textColor = kPrimaryTextColor,
    this.textSize = 18.0,
    this.elevation = 0.0,
    this.radius = 50,
    this.border = BorderSide.none,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: border,
          ),
        ),
        onPressed: onPressed,
        child: Center(child: child),
      ),
    );
  }
}
