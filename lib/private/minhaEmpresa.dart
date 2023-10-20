import 'package:flutter/material.dart';




class MinhaEmpresaScreen extends StatefulWidget {
  const MinhaEmpresaScreen({Key? key}) : super(key: key);

  @override
  State<MinhaEmpresaScreen> createState() => _MinhaEmpresaScreenState();
}

class _MinhaEmpresaScreenState extends State<MinhaEmpresaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Minha Empresa',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Nome:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Cometa Eventos'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Site:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('www.cometaeven.com.br'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Endereço:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Rua Jasmin, 470'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('cometa.ev@gmail.com'),
                ],
              ),
            ],
          )),
        )));
  }
}
