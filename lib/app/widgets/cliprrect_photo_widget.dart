import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ClipRRectPhotoWidget extends StatelessWidget {
  final String photo;
  final Color? color;
  final String? text;

  const ClipRRectPhotoWidget({
    Key? key,
    required this.photo,
    this.color = Colors.black12,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: CachedNetworkImage(
        imageUrl: photo,
        width: 32,
        height: 32,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Text(
            text!,
            style: TextStyle(
              color: Constants.blackColor,
            ),
          ),
        ),
        placeholder: (context, url) => Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Constants.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
