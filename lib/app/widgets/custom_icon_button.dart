import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  final Color color;
  final Function()? onTap;
  final double elevation;
  final double borderRadius;
  final double paddingButton;
  final Widget? widget;

  const CustomIconButton({
    Key? key,
    this.color = Constants.blackColor,
    this.onTap,
    this.elevation = 0,
    this.borderRadius = 12,
    this.paddingButton = 5,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (Set<MaterialState> states) {
            return EdgeInsets.all(paddingButton);
          },
        ),
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return color; // Disabled color
          }
          return color; // Regular color
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onTap,
      child: widget,
    );
  }
}
