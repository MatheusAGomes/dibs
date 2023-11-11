import 'package:dibs/public/auth/signup.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';
import '../../shared/service/MyPageController.dart';
import '../../shared/service/toastService.dart';
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

  Future<void> _submit() async {
    Auth auth = Provider.of<Auth>(context, listen: false);
    try {
      Provider.of<MyPageIndexProvider>(context, listen: false).updateIndex(0);
      auth.deslogar();
    } catch (e) {
      print(e);
    }

    try {
      await auth.logar(
        usuarioController.text.toLowerCase().toString(),
        senhaController.text.toString(),
      );
      Navigator.pushNamed(context, Routes.AUTH);
    } on DioError {
      ToastService.showToastError('erro');
    } finally {}
  }

  int value = 0;
  TextEditingController usuarioController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/signinBackground.jpg"),
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
                    children: [SvgPicture.asset("assets/images/logoDibs.svg")],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Revenda segura \ne intuitiva',
                      style: TextStyleService(fontSize: 50).corSublinhadaSignIn,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'A solução definitiva para \ncompra e revenda de ingressos.\nSeus eventos mais marcantes estão aqui.',
                      style:
                          TextStyleService(fontSize: 17, letterSpacing: -1.41)
                              .medium,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    children: [
                      Text(
                        'Usuário',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      controller: usuarioController, height: 0.05),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        'Senha',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      hideTextfild: true,
                      controller: senhaController,
                      height: 0.05),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ButtonPadrao(
                      enable: true,
                      delete: false,
                      width: 0.5,
                      text: "Entrar",
                      click: () {
                        _submit();
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Ainda não é usuário?',
                          style: TextStyleService.defaultSignIn,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: Text(
                            'Cadastre-se agora',
                            style: TextStyleService.greenSignIn,
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
