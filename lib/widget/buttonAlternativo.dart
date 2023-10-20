import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class ButtonAlternativo extends StatelessWidget {
  final String btnName;
  final VoidCallback click;
  final double tamanho;
  const ButtonAlternativo(
      {super.key,
      required this.btnName,
      required this.click,
      this.tamanho = 0.07});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        click();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * tamanho,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            // ignore: prefer_const_constructors
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: ColorService.azul, width: 3)),
        child: Center(
          child: Text(
            btnName,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: MediaQuery.of(context).size.height *
                      0.02,
                  color: ColorService.azul,
                ),
          ),
        ),
      ),
    );
  }
}
