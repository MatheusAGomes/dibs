import 'package:dibs/repositories/autenticationResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/constance/environment.dart';
import 'autenticacao.dart';

part 'authentication-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/auth/login")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("")
  Future<AutenticationResponse> authenticate(
      @Body() Autenticacao authentication);
}
