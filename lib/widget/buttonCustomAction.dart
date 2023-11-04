import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../models/meuIngressoBanner.dart';
import '../private/modalMeusIngressosAnuncio.dart';
import '../repositories/ticket-repository.dart';
import '../shared/service/textStyle.dart';

class ButtonCustomAction extends StatelessWidget {
  String text;
  VoidCallback click;
  Icon? icon;
  double height;
  double width;
  double fontSize;

  ButtonCustomAction({
    super.key,
    required this.text,
    required this.click,
    required this.icon,
    this.height = 40,
    this.width = 40,
    this.fontSize = 18
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:
                    BorderRadius.circular(5)),
                height: height,
                width: width,
                child: icon,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style:
              TextStyleService(fontSize: fontSize).iconButtonText,
            )
          ]),
    );
  }
}