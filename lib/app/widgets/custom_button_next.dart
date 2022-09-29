import 'package:ecommerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonNextStep extends StatelessWidget {
  final String? label;
  final Function()? onTap;

  const ButtonNextStep({
    Key? key,
    this.label = 'Continuar',
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 20),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Constants.blackColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: 18,
                  color: onTap == null
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
