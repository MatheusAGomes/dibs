import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/service/colorService.dart';



class TextFieldPerfil extends StatefulWidget {
  final Key? textFormFildKey;
  final TextEditingController controller;
  final bool editable;
  final String? textLabel;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType keyboardtype;
  final String? Function(String?)? onchange;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final int? maxLength;
  final counterText;
  const TextFieldPerfil({super.key, 
    required this.controller,
    this.textFormFildKey,
    required this.editable,
    this.hintText,
    this.keyboardtype = TextInputType.text,
    this.textLabel,
    this.onchange,
    this.validator,
    this.inputFormatter,
    this.focusNode,
    this.maxLength,
    this.counterText
  });

  @override
  State<TextFieldPerfil> createState() => _MyTextFiealProfiledState();
}

class _MyTextFiealProfiledState extends State<TextFieldPerfil> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,

      key: widget.textFormFildKey,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatter,
      onChanged: widget.onchange,
      validator: widget.validator,
      style: TextStyle(
          color: widget.editable == false ? Colors.grey : Colors.black),
      controller: widget.controller,
      enabled: widget.editable,
      decoration: InputDecoration(
        counterText: widget.maxLength != null ? "" : widget.counterText ,
        disabledBorder: const OutlineInputBorder(

            borderSide: BorderSide(width: 1, color: Color(0XFFDDE2EA))),
        contentPadding:
             const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        hintStyle: TextStyle(
          color: ColorService.verde,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1,
            color: ColorService.cinza,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 2,
            color: ColorService.verde,
          ),

        ),
      ),
    );
  }
}
