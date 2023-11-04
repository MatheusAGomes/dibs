import 'package:dibs/models/clienteRegister.dart';
import 'package:dibs/repositories/autenticationResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/constance/environment.dart';
import 'autenticacao.dart';

part 'authentication-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/auth")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("/login")
  Future<AutenticationResponse> authenticate(
      @Body() Autenticacao authentication);
  @POST("/register/client")
  Future<HttpResponse<void>> criarUsuario(@Body() ClientRegister cliente);
}
