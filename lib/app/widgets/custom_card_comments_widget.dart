import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/utils.dart';
import 'cliprrect_photo_widget.dart';

final int length = 1;
final double between = 0.0;
final double starSize = 20;

class CustomCardCommentsWidget extends StatelessWidget {
  final String id;
  final String name;
  final String comment;
  final String photo;
  final double review;
  final String date;

  const CustomCardCommentsWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.comment,
    required this.photo,
    this.review = 0,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizedBox space = SizedBox(width: between);

    Icon chooseStar(int index) => (review >= index + 1)
        ? Icon(Icons.star, color: Constants.blackColor, size: starSize)
        : (review >= index + 0.5)
            ? Icon(Icons.star_half, color: Constants.blackColor, size: starSize)
            : Icon(Icons.star_border, color: Constants.textColor, size: starSize);

    return Container(
      width: Utils.mediaQuery(context, 1),
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: ClipRRectPhotoWidget(
                        photo: photo,
                        color: Constants.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          color: Constants.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < 5; i++) ...[
                            if (i > 0) space,
                            GestureDetector(
                              onTap: () {},
                              child: chooseStar(i),
                            ),
                          ]
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Text(
                date,
                style: GoogleFonts.poppins(
                  color: Constants.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.25,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            comment,
            style: GoogleFonts.poppins(
              color: Constants.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
