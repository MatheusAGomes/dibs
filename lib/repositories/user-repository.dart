import 'package:dibs/models/eventsClient.dart';
import 'package:dibs/models/lote.dart';
import 'package:dibs/models/newPassword.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

import '../shared/constance/environment.dart';
part 'user-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/users")
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @PUT("/change-password")
  Future<HttpResponse<void>> trocarSenha(@Body() NewPassword newPassword);
}
