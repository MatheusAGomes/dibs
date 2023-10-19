import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/public/auth/signup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';
import '../../widget/textfieldpadrao.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
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
    } on DioError catch (dioError) {
      //  ToastService.showToastError(dioError.message);
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Color(0xff7EF4D1), BlendMode.modulate),
            image: AssetImage("assets/images/loginPageImage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                    child: Text(
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
                    child: Text(
                      'A solução definitiva para compra e revenda de ingressos.\nSeus eventos mais marcantes estão aqui.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
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
                  Row(
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
                        child: Center(
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorService.verde,
                        ),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.5,
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
                        Text(
                          'Ainda não é usuário?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
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
