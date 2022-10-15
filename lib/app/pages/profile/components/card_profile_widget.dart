import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants.dart';

class CardProfileWidget extends StatelessWidget {
  final IconData? icon;
  final String? iconSvg;
  final String? title;
  final Function()? onTap;

  const CardProfileWidget({
    Key? key,
    this.icon,
    this.iconSvg,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon != null
                      ? Icon(
                          icon,
                          size: 24,
                        )
                      : SvgPicture.asset(
                          'assets/icons/$iconSvg.svg',
                          width: 24,
                          height: 24,
                          color: Constants.blackColor,
                        ),
                  SizedBox(width: 12),
                  Text(
                    title!,
                    style: GoogleFonts.poppins(
                      color: Constants.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
