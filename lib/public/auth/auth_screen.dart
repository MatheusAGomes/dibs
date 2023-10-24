import 'package:dibs/private/estruturaEmpresa.dart';
import 'package:dibs/public/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/auth.dart';
import '../../private/estruturaScreen.dart';
import '../../shared/service/colorService.dart';
import 'signin.dart';

class AuthScreen extends StatefulWidget {
  final String? possiblelink;
  const AuthScreen(this.possiblelink);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    String? link = widget.possiblelink;

    Auth auth = Provider.of(context);
    return FutureBuilder(
      future: auth.tentarLoginAutomatico(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: ColorService.cinza,
              ),
            ),
          );
        } else if (snapshot.error != null) {
          return EstruturasScreen();
        } else {
          if (auth.estaAutenticado) {
            return SignInScreen();
          } else {
           return EstruturasScreen();
           //  return EstruturaEmpresa();
           //  return SignInScreen();
            //return SignUpScreen();
          }
        }
      },
    );
  }
}
