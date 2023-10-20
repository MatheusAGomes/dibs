import 'package:dibs/models/eventsClient.dart';
import 'package:dibs/models/lote.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

import '../shared/constance/environment.dart';
part 'loteEvent-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/batches")
abstract class LoteRepository {
  factory LoteRepository(Dio dio, {String baseUrl}) = _LoteRepository;

  @GET("/list/{id}")
  Future<List<Lote>> getLotes(@Path('id') String id);
}
