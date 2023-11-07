import 'package:dibs/models/cards.dart';
import 'package:dibs/models/clientInput.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import '../shared/constance/environment.dart';
part 'clients-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/clients")
abstract class ClientsRepository {
  factory ClientsRepository(Dio dio, {String baseUrl}) = _ClientsRepository;

  @GET("/account")
  Future<ClientInput> getCliente();
  @PUT("/account")
  Future<HttpResponse<void>> putCLiente(@Body() ClientInput cliente);
}
