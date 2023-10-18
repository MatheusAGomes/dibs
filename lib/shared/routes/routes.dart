import 'package:dibs/private/estruturaScreen.dart';
import 'package:flutter/widgets.dart';

import '../../public/auth/auth_screen.dart';
import '../../public/auth/signin.dart';

class Routes {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String SIGNIN = "/auth/signin";

  static const String AUTH = "/auth/";

  static const String MAINUSER = "/auth/main";

  final routes = <String, WidgetBuilder>{
    Routes.SIGNIN: (BuildContext context) => SignInScreen(),
    Routes.AUTH: (BuildContext context) => const AuthScreen(null),
    Routes.MAINUSER: (BuildContext context) =>
        EstruturasScreen(pagina: 1, listaDeEventos: []),
  };
}
