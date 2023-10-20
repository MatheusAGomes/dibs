import 'package:flutter/material.dart';


class ModalAjuda extends StatelessWidget {
  ModalAjuda({super.key});

  TextEditingController assuntoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ajuda',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    InkWell(
                      child: const Icon(Icons.close),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      'Como posso te ajudar ?',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        Text('Assunto',
                            style: TextStyle(fontWeight: FontWeight.w900)),
                      ],
                    ),
                    SizedBox(
                      height: 34,
                      width: 343,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        controller: assuntoController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.grey)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        Text('Pergunta/Reclamação',
                            style: TextStyle(fontWeight: FontWeight.w900)),
                      ],
                    ),
                    SizedBox(
                      height: 34,
                      width: 343,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        controller: assuntoController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade300)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide:
                                  const BorderSide(width: 1, color: Colors.grey)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text('Email para contato',
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ],
                ),
                const Row(
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
                onPressed: () {},
                child: const Text(
                  'Enviar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
