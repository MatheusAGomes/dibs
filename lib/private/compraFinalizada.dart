import 'package:dibs/shared/routes/routes.dart';
import 'package:flutter/material.dart';


class CompraFinalizada extends StatefulWidget {
  const CompraFinalizada({super.key});

  @override
  State<CompraFinalizada> createState() => _CompraFinalizadaState();
}

class _CompraFinalizadaState extends State<CompraFinalizada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
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
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Center(
                child: Icon(
                  Icons.check_circle_outline_outlined,
                  color: Color(0xFF198A68),
                  size: 120,
                ),
              ),
              const Text('Compra finalizada!'),
              const Text('Pagamento realizado com sucesso.'),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 4,
                color: Colors.grey[200],
                child: const Padding(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Júlio Cesar Moura')],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 4,
                color: Colors.grey[200],
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.credit_card),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Crédito')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Subtotal'), Text("R\$ 540,00")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Desconto'), Text("R\$ 0,00")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "R\$ 540,00",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 4,
                  color: Colors.grey[200],
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Impirmir comprovante')],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.MAINUSER);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 4,
                  color: Colors.grey[200],
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Voltar para tela inicial')],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )),
        ),
      ),
    );
  }
}
