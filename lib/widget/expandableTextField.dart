import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpandableTextField extends StatefulWidget {
  final GlobalKey<FormFieldState>? textFormFildKey;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardtype;
  final bool hideTextfild;
  final VoidCallback? click;
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
  final double height;
  final double width;
  final int maxLines;

  ExpandableTextField({
    this.textFormFildKey,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardtype = TextInputType.text,
    this.hideTextfild = false,
    this.click,
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
    required this.height,
    this.width = 1,
    this.maxLines = 1,
  });

  @override
  State<ExpandableTextField> createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * widget.height,
        width: MediaQuery.of(context).size.width * widget.width,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(2, 2),
                    blurRadius: 0.3)
              ]),
          child: TextFieldPadrao(
            textFormFildKey: widget.textFormFildKey,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            keyboardtype: widget.keyboardtype,
            hideTextfild: widget.hideTextfild,
            click: () {
              if (widget.click != null) {
                widget.click!();
              }
            },
            fontSize: widget.fontSize,
            validator: widget.validator,
            controller: widget.controller,
            onchange: widget.onchange,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: widget.focusNode,
            errorText: widget.errorText,
            padding: widget.padding,
            maxlength: widget.maxlength,
            enable: widget.enable,
            inputFormatter: widget.inputFormatter,
            maxLines: widget.maxLines,
          ),
        ));
  }
}
