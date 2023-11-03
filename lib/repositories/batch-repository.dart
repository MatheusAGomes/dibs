import 'package:dibs/models/batchInput.dart';
import 'package:dibs/models/batchReportIndex.dart';
import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/models/soldTickets.dart';
import 'package:dibs/models/statusFilter.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;
import '../models/batchManage.dart';
import '../shared/constance/environment.dart';
part 'batch-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/batches")
abstract class BatchRepository {
  factory BatchRepository(Dio dio, {String baseUrl}) = _BatchRepository;

  @GET("/reports/{eventId}")
  Future<List<BatchReportIndex>> getLoteAtivo(@Path('eventId') eventId);
  @GET("/numberOfTickets/{eventId}")
  Future<SoldTickets> getIngressosTotais(@Path('eventId') eventId);
  @GET("/list-all/{eventId}")
  Future<List<BatchManage>> getAllLotes(@Path('eventId') eventId);
  @POST("")
  Future<HttpResponse<void>> criarLote(@Body() BatchInput batchInput);
  @GET("/next-batches/{id}")
  Future<List<IdName>> getLotesPossiveis(@Path('id') eventId);
}
