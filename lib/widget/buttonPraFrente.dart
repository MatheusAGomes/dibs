import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';



class ButtonPraFrente extends StatelessWidget {
  final Function fun;

  const ButtonPraFrente({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => fun,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(65, 65),
          shape: const CircleBorder(),
          backgroundColor: ColorService.verde,
          elevation: 0.0,
          shadowColor: Colors.transparent),
      child: Image.asset('assets/images/Vectorbtn-arrow-1.png'),
    );
  }
}
