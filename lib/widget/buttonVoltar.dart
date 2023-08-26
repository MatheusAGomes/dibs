import 'package:flutter/material.dart';

import '../../shared/constance/constance.dart';



class ButtonVoltar extends StatelessWidget {
  final double? tamanho;
  final VoidCallback? funcao;
  const ButtonVoltar({super.key, this.tamanho, this.funcao});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        funcao!();
        // Navigator.pop(context);
      },
      child: Image.asset(
        ConstanceData.back,
        height: MediaQuery.of(context).size.height * 0.001,
        width: MediaQuery.of(context).size.height * 0.001,
      ),
    );
  }
}
