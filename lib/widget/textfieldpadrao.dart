import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/service/InputDecorationService.dart';
import '../shared/service/textStyle.dart';

class TextFieldPadrao extends StatefulWidget {
  final GlobalKey<FormFieldState>? textFormFildKey;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardtype;
  final bool hideTextfild;
  final VoidCallback click;
  final double fontSize;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? Function(String?)? onchange;
  final FocusNode? focusNode;
  final String? errorText;
  final dynamic padding;
  final int? maxlength;
  final bool? enable;
  List<TextInputFormatter>? inputFormatter;
  int maxLines;

  TextFieldPadrao(
      {this.textFormFildKey,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardtype = TextInputType.text,
      this.hideTextfild = false,
      required this.click,
      this.fontSize = 10,
      this.validator,
      this.controller,
      this.onchange,
      this.textInputAction,
      this.onFieldSubmitted,
      this.focusNode,
      this.errorText,
      this.padding,
      this.maxlength,
      this.enable,
      this.inputFormatter,
      this.maxLines = 1});

  @override
  State<TextFieldPadrao> createState() => _TextFieldPadraoState();
}

class _TextFieldPadraoState extends State<TextFieldPadrao> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatter,
      enabled: widget.enable,
      maxLines: widget.maxLines,
      maxLength: widget.maxlength,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      key: widget.textFormFildKey,
      onChanged: widget.onchange,
      controller: widget.controller,
      validator: widget.validator,
      onTap: () {
        widget.click();
      },
      obscureText: widget.hideTextfild,
      keyboardType: widget.keyboardtype,
      style: TextStyleService(
          color: Color(0xFF000000)
      ).defaultTextField,
      cursorColor: Colors.grey,
      decoration: InputDecorationService(
              prefixIcon: widget.prefixIcon, hint: widget.hintText)
          .inputPadrao,
    );
  }
}
