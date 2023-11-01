import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../models/meuIngressoBanner.dart';
import '../private/modalMeusIngressosAnuncio.dart';
import '../repositories/ticket-repository.dart';
import '../shared/service/textStyle.dart';

class ButtonNewAction extends StatelessWidget {
  String text;
  VoidCallback click;
  IconData? icon;

  ButtonNewAction({
    super.key,
    required this.text,
    required this.click,
    this.icon = FontAwesomeIcons.plus
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
                height: 40,
                width: 40,
                child: Icon(icon),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style:
              TextStyleService.iconButtonText,
            )
          ]),
    );
  }
}