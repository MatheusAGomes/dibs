import 'package:dibs/models/cards.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import '../shared/constance/environment.dart';
part 'card-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/cards")
abstract class CardRepository {
  factory CardRepository(Dio dio, {String baseUrl}) = _CardRepository;

  @GET("/list")
  Future<List<Cards>> getCards();
}
