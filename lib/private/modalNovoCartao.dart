import 'package:flutter/material.dart';

class ModalNovoCartao extends StatefulWidget {
  const ModalNovoCartao({super.key});

  @override
  State<ModalNovoCartao> createState() => _ModalNovoCartaoState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();
TextEditingController cpfController = TextEditingController();
TextEditingController numeroController = TextEditingController();
TextEditingController cvcController = TextEditingController();
TextEditingController validadeController = TextEditingController();

class _ModalNovoCartaoState extends State<ModalNovoCartao> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Novo cartão',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      InkWell(
                        child: const Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all(Colors.orange),
                        value: checkboxValue,
                        onChanged: (value) => setState(() {
                          checkboxValue = value!;
                        }),
                      ),
                      const Text('Sou titular deste cartão')
                    ],
                  ),
                  const Row(
                    children: [Text('Nome')],
                  ),
                  SizedBox(
                    height: 34,
                    width: 343,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      controller: nomeController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [Text('CPF')],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 34,
                        width: 260,
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          controller: cpfController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [Text('Número do cartão')],
                  ),
                  SizedBox(
                    height: 34,
                    width: 343,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      controller: numeroController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.credit_card,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('CVC'),
                          SizedBox(
                            height: 34,
                            width: 120,
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              controller: cvcController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade300)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Validade'),
                          SizedBox(
                            height: 34,
                            width: 120,
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              controller: validadeController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade300)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  onPressed: () {},
                  child: const Text(
                    'Adicionar cartão',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
