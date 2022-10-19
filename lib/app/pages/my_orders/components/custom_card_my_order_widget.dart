import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants.dart';

class CustomCardMyOrderWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final double? fontSizeTitle;
  final double? fontSizeSubTitle;

  const CustomCardMyOrderWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    this.fontSizeTitle = 12,
    this.fontSizeSubTitle = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Constants.textColor,
            fontSize: fontSizeTitle,
            fontWeight: FontWeight.w500,
            height: 2
          ),
        ),
        Text(
          subTitle,
          style: GoogleFonts.poppins(
            color: Constants.blackColor,
            fontSize: fontSizeSubTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
