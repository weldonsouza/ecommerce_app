import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/constants.dart';

class CardExpansionTileWidget extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget>? widget;

  const CardExpansionTileWidget({
    Key? key,
    required this.title,
    this.description,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.7,
          ),
        ),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(left: 0),
        expandedAlignment: Alignment.centerLeft,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: Constants.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: widget ?? [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              description!,
              style: GoogleFonts.poppins(
                color: Constants.textField,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
