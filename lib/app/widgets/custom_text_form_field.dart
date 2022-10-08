import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hint;
  final Color? textColorText;
  final Color? hintColorText;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FontWeight fontWeight;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final double paddingLeft;
  final double paddingRight;
  final String Function()? errorText;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.labelText = '',
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight = FontWeight.w500,
    this.textColorText = Constants.textField,
    this.hintColorText = Constants.textField,
    this.borderColor = Constants.textField,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.obscureText = false,
    this.paddingLeft = 16,
    this.paddingRight = 16,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.paddingLeft, right: widget.paddingRight),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: widget.textColorText ?? Colors.grey,
          fontWeight: widget.fontWeight,
        ),
        cursorColor: Constants.textColor,
        inputFormatters: widget.inputFormatters,
        autocorrect: false,
        textInputAction: TextInputAction.next,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon ?? null,
          suffixIcon: SizedBox(
            height: 60,
            child: widget.suffixIcon,
          ),
          hintText: widget.hint ?? '',
          isDense: true,
          contentPadding: const EdgeInsets.all(12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: Constants.textColor,
            fontWeight: widget.fontWeight,
          ),
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: widget.hintColorText ?? Colors.grey,
            fontWeight: widget.fontWeight,
          ),
          errorText: widget.errorText == null ? null : widget.errorText!(),
        ),
        onChanged: (value) {
          if (widget.onChanged != null) widget.onChanged!(value);
        },
      ),
    );
  }
}
