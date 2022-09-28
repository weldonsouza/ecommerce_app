import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  var controller;
  var initialValue;
  var labelText;
  var marginTop;
  var marginLeft;
  var marginRight;
  var textInputType;
  var onChange;
  var formatter;
  var maxLength;
  var value;
  var focusNode;
  var hint;
  var counterText;
  var textColorText;
  var hintColorText;
  var prefixIcon;
  var suffixIcon;
  final FontWeight fontWeight;
  bool isEnabled;
  bool inputBorder;
  String Function()? errorText;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.initialValue,
    this.labelText = "",
    this.marginTop = 10.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.textInputType = TextInputType.text,
    this.formatter,
    this.onChange,
    this.maxLength,
    this.value,
    this.focusNode,
    this.hint,
    this.counterText,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight = FontWeight.w400,
    this.isEnabled = true,
    this.inputBorder = false,
    this.textColorText = Constants.textField,
    this.hintColorText = Constants.textField,
    this.errorText,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: widget.marginTop,
        left: widget.marginLeft,
        right: widget.marginRight,
      ),
      child: TextFormField(
        keyboardType: widget.textInputType,
        controller: widget.controller,
        initialValue: widget.initialValue,
        style: GoogleFonts.raleway(
          fontSize: 16,
          color: widget.textColorText != null ? widget.textColorText : Colors.grey,
          fontWeight: widget.fontWeight,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hint ?? "",
          counterText: widget.counterText ?? '',
          border: widget.inputBorder == true
              ? InputBorder.none
              : const OutlineInputBorder(),
          labelStyle: GoogleFonts.raleway(
            fontSize: 16,
            color: widget.hintColorText != null ? widget.hintColorText : Colors.grey,
            fontWeight: widget.fontWeight,
          ),
          hintStyle: GoogleFonts.raleway(
            fontSize: 16,
            color: widget.hintColorText != null ? widget.hintColorText : Colors.grey,
            fontWeight: widget.fontWeight,
          ),
          errorText: widget.errorText == null ? null : widget.errorText!(),
        ),
        cursorColor: Constants.appTextColor,
        inputFormatters: widget.formatter != null ? [widget.formatter] : [],
        autocorrect: false,
        textInputAction: TextInputAction.next,
        maxLength: widget.maxLength,
        onChanged: (value) {
          if (widget.onChange != null) widget.onChange(value);
        },
        enabled: widget.isEnabled,
      ),
    );
  }
}
