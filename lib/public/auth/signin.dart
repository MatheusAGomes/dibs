import 'package:dibs/public/auth/signup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';
import '../../widget/textfieldpadrao.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? gamb = await Store.getString("auth");
      if (gamb == null) {
        Auth auth = Provider.of<Auth>(context, listen: false);
        auth.deslogar();
      }
    });
  }

  int value = 0;
  TextEditingController usuarioController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  Future<void> _submit() async {
    Auth auth = Provider.of<Auth>(context, listen: false);

    try {
      await auth.logar(
        usuarioController.text.toLowerCase().toString(),
        senhaController.text.toString(),
      );
      Navigator.pushNamed(context, Routes.AUTH);
    } on DioError {
      //  ToastService.showToastError(dioError.message);
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Color(0xff7EF4D1), BlendMode.modulate),
            image: AssetImage("assets/images/loginPageImage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [Image.asset("assets/images/Dibs logo.png")],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      'Revenda segura e intuitiva',
                      style: TextStyle(
                          height: 1,
                          fontWeight: FontWeight.w800,
                          fontSize: 45,
                          letterSpacing: -1.41,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(1.5, 1.5),
                                color: Color.fromRGBO(126, 244, 209, 0.72))
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Text(
                      'A solução definitiva para compra e revenda de ingressos.\nSeus eventos mais marcantes estão aqui.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Usuario',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(11),
                      child: TextFieldPadrao(
                        controller: usuarioController,
                        click: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Senha',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(11),
                      child: TextFieldPadrao(
                        controller: senhaController,
                        click: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        print('a');
                        _submit();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorService.verde,
                        ),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Center(
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Ainda não é usuário?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()));
                          },
                          child: Text(
                            'Cadastre-se agora',
                            style: TextStyle(color: ColorService.verde),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
