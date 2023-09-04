import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';
import 'meuCartaoComponente.dart';

class ModalMeusCartoes extends StatelessWidget {
  ModalMeusCartoes();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Meus cartões',
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
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MeuCartaoComponente(
                        numero: "1234123412341234", tipo: "Crédito"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
