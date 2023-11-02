import 'package:dibs/models/batchReportIndex.dart';
import 'package:dibs/models/eventInput.dart';
import 'package:dibs/models/events.dart';
import 'package:dibs/models/statusFilter.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import '../shared/constance/environment.dart';
part 'events-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/events")
abstract class EventsRepository {
  factory EventsRepository(Dio dio, {String baseUrl}) = _EventsRepository;

  @GET("/list")
  Future<List<Events>> getListEvents();
  @GET("/list")
  Future<List<Events>> getListEventsFilter(@Body() StatusFilter status);
  @GET("/my-events")
  Future<List<Events>> getMyEvents();
  @GET("/next-event")
  Future<Events> getNextEvents();
  @POST("")
  Future<HttpResponse<void>> criarEvento(@Body() EventInput evento);
}
