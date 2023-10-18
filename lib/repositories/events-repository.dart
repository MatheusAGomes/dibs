import 'package:dibs/models/events.dart';
import 'package:dibs/models/statusFilter.dart';
import 'package:dibs/repositories/autenticationResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

import '../shared/constance/environment.dart';
import 'autenticacao.dart';
part 'events-repository.g.dart';

@RestApi(baseUrl: Environment.BASE_URL + "/events")
abstract class EventsRepository {
  factory EventsRepository(Dio dio, {String baseUrl}) = _EventsRepository;

  @GET("/list")
  Future<List<Events>> getListEvents();
  @GET("/list")
  Future<List<Events>> getListEventsFilter(@Body() StatusFilter status);
}
