import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';

class CustomButton extends StatelessWidget {
  String? labelText;
  final Color color;
  final Color colorText;
  final Color colorIconButton;
  final Color? colorSvg;
  final Color colorButton;
  Function()? onTap;
  String? iconSvg;
  IconData? iconData;
  final double width;
  final double height;
  final double elevation;
  final double borderRadius;
  final double textSize;
  final double iconSize;
  final double paddingButton;
  final FontWeight fontWeight;
  final double rightButton;
  final double leftButton;
  final MainAxisAlignment mainAxisAlignment;

  CustomButton({
    Key? key,
    this.labelText,
    this.color = Constants.primaryContainer,
    this.colorText = Constants.blackColor,
    this.colorIconButton = Constants.whiteColor,
    this.colorSvg,
    this.colorButton = Constants.primaryColor,
    this.onTap,
    this.iconSvg,
    this.iconData,
    required this.width,
    this.height = 40,
    this.elevation = 0,
    this.borderRadius = 0,
    this.textSize = 14,
    this.iconSize = 28,
    this.paddingButton = 5,
    this.fontWeight = FontWeight.w500,
    this.rightButton = 10,
    this.leftButton = 0,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
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
          side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.pressed)
                ? Colors.grey.shade100
                : colorButton;
            return BorderSide(color: color, width: 1);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              iconSvg != null
                  ? Padding(
                      padding: EdgeInsets.only(left: leftButton, right: 15),
                      child: SvgPicture.asset(
                        'assets/$iconSvg.svg',
                        color: colorSvg,
                        width: iconSize,
                      ),
                    )
                  : Container(),
              iconData != null
                  ? Padding(
                      padding:
                          EdgeInsets.only(left: leftButton, right: rightButton),
                      child: Icon(
                        iconData,
                        color: colorIconButton,
                        size: iconSize,
                      ),
                    )
                  : Container(),
              labelText!.isEmpty
                  ? Container()
                  : Text(
                      labelText!,
                      style: GoogleFonts.raleway(
                        color: colorText,
                        fontSize: textSize,
                        fontWeight: fontWeight,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
