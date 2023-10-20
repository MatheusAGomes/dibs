import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';


class ComponenteGerenciadoDeLotes extends StatelessWidget {
  const ComponenteGerenciadoDeLotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(7)),
      height: 60,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Camarote - 4° Lote'),
                Text(
                  'R\$ 80,00',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            title: const Text(
                              'Editar lote',
                              style: TextStyle(color: Colors.black),
                            ),
                            centerTitle: true,
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                )),
                          ),
                          body: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Titulo'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Qntd. de ingressos'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: TextFieldPadrao(
                                              click: () {},
                                              enable: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Preço'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: TextFieldPadrao(
                                              click: () {},
                                              enable: false,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Text('Lote Programado'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  const Text('Status'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: const Color(0xFF198A68),
                                        ),
                                        width: 140,
                                        height: 40,
                                        child: const Center(
                                          child: Text(
                                            'Salvar',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5)),
                    height: 35,
                    width: 35,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5)),
                    height: 35,
                    width: 35,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
