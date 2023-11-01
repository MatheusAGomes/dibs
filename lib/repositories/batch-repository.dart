import 'package:dibs/models/batchReportIndex.dart';
import 'package:dibs/models/events.dart';
import 'package:dibs/models/soldTickets.dart';
import 'package:dibs/models/statusFilter.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import '../shared/constance/environment.dart';
part 'batch-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/batches")
abstract class BatchRepository {
  factory BatchRepository(Dio dio, {String baseUrl}) = _BatchRepository;

  @GET("/reports/{eventId}")
  Future<BatchReportIndex> getLoteAtivo(@Path('eventId') eventId);
  @GET("/reports/{eventId}")
  Future<SoldTickets> getIngressosTotais(@Path('eventId') eventId);
}
