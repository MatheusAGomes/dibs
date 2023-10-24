import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../main.dart';
import '../repositories/autenticacao.dart';
import '../repositories/autenticationResponse.dart';
import '../repositories/authentication-repository.dart';
import '../shared/store.dart';

class Auth with ChangeNotifier {
  final Dio _dio;
  String? _token;
  final String _key = 'auth';
  Map<String, dynamic>? authDecoded;

  Auth(this._dio);

  bool get estaAutenticado {
    return token != null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  void decodificarToken(token) {
    final decodedToken = JwtDecoder.decode(token);
    authDecoded = decodedToken;
  }

  String decodificar(response) {
    String token = response;

    decodificarToken(token);
    print(authDecoded);
    return token;
  }

  Future<void> _autenticar(String username, String password) async {
    LoginApi loginApi = LoginApi(dio);
    try {
      AutenticationResponse data = await loginApi
          .authenticate(Autenticacao(login: username, password: password));

      _token = decodificar(data.token);
      print(_token);
      Store.saveString(_key, _token!);

      notifyListeners();
      //Store.saveString(this._key, _token!);
    } on DioError {
      rethrow;
    } catch (e) {
      print(e);
    }
    return Future.value();
  }

  Future<void> logar(String username, String password) async {
    return _autenticar(username, password);
  }

  Future<void> tentarLoginAutomatico() async {
    if (estaAutenticado) {
      return Future.value();
    } else {
      _token = await Store.getString(_key);
      if (_token != null) {
        decodificarToken(token);
        notifyListeners();
      }

      return Future.value();
    }
  }

  void deslogar() {
    _token = null;
    Store.remove('auth');
    notifyListeners();
  }
}
