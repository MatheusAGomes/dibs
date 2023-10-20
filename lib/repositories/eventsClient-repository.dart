import 'package:dibs/models/eventsClient.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

import '../shared/constance/environment.dart';
part 'eventsClient-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/events")
abstract class EventsClientRepository {
  factory EventsClientRepository(Dio dio, {String baseUrl}) =
      _EventsClientRepository;

  @GET("/client/{id}")
  Future<EventsClient> getListEvents(@Path('id') String id);
}
