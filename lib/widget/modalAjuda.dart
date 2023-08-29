import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class ModalAjuda extends StatelessWidget {
  ModalAjuda();

  TextEditingController assuntoController = TextEditingController();

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
                  'Ajuda',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                InkWell(
                  child: Icon(Icons.close),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Como posso te ajudar ?',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('Assunto',
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ],
                ),
                Container(
                  height: 34,
                  width: 343,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    controller: assuntoController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('Pergunta/Reclamação',
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ],
                ),
                Container(
                  height: 34,
                  width: 343,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    controller: assuntoController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text('Email para contato',
                    style: TextStyle(fontWeight: FontWeight.w900)),
              ],
            ),
            Row(
              children: [
                Text('suporte@trocatroca.com',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.grey,
                        decoration: TextDecoration.underline)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
