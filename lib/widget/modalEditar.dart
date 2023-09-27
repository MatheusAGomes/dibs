import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class ModalEditar extends StatelessWidget {
  ModalEditar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Meu perfil',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                InkWell(
                  child: Icon(Icons.close),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
