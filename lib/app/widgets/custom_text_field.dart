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
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FontWeight fontWeight;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String Function()? errorText;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.labelText = '',
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight = FontWeight.w400,
    this.textColorText = Constants.textField,
    this.hintColorText = Constants.textField,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: GoogleFonts.raleway(
        fontSize: 16,
        color: widget.textColorText ?? Colors.grey,
        fontWeight: widget.fontWeight,
      ),
      cursorColor: Constants.textColor,
      inputFormatters: widget.inputFormatters,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hint ?? "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: GoogleFonts.raleway(
          fontSize: 16,
          color: Constants.textColor,
          fontWeight: widget.fontWeight,
        ),
        hintStyle: GoogleFonts.raleway(
          fontSize: 16,
          color: widget.hintColorText ?? Colors.grey,
          fontWeight: widget.fontWeight,
        ),
        errorText: widget.errorText == null ? null : widget.errorText!(),
      ),
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
    );
  }
}
