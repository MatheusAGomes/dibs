import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/constance/environment.dart';
import 'autenticacao.dart';

part 'authentication-repository.g.dart';

@RestApi(baseUrl: Environment.BASE_URL + "login")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("")
  Future<HttpResponse<void>> authenticate(
      @Body() Autenticacao authentication);
}

