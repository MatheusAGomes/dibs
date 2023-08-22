import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../repositories/autenticacao.dart';
import '../repositories/authentication-repository.dart';
import '../repositories/refreshToken.dart';
import '../shared/store.dart';

class Auth with ChangeNotifier {
  Dio _dio;
  String? _token;
  String _key = 'auth';
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
    this.authDecoded = jsonDecode(decodedToken['sub']);
  }

  String decodificar(response) {
    final authorization = response.headers.map['authorization'];
    String token = authorization[0].toString().split(' ')[1];
    this.decodificarToken(token);
    print(this.authDecoded);
    return token;
  }

  Future<void> _autenticar(String username, String password) async {
    LoginApi loginApi = LoginApi(this._dio);
    try {
      final data = await loginApi
          .authenticate(Autenticacao(username: username, password: password));

      _token = this.decodificar(data.response);
      print(token);
      Store.saveString(this._key, _token!);
      notifyListeners();
      //Store.saveString(this._key, _token!);
    } on DioError catch (dioError) {
      throw dioError;
    } catch (e) {
      print(e);
    }
    return Future.value();
  }

  Future<void> atualizar() async {
    RefreshApi refreshApi = RefreshApi(this._dio);
    try {
      final data = await refreshApi.refreshToken();

      _token = this.decodificar(data.response);
      print(token);
      Store.saveString(this._key, _token!);
      notifyListeners();
      //Store.saveString(this._key, _token!);
    } on DioError catch (dioError) {
      throw dioError;
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
    Store.remove(this._key);
    notifyListeners();
  }
}
