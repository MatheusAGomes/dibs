import 'package:dibs/models/meuIngressoBanner.dart';
import 'package:dibs/models/ticketOrganizer.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/ticketOutput.dart';
import '../shared/constance/environment.dart';

part 'ticket-repository.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}/tickets")
abstract class TicketRepository {
  factory TicketRepository(Dio dio, {String baseUrl}) = _TicketRepository;

  @POST("/buy/organizer")
  Future<HttpResponse<void>> buyTicket(@Body() TicketOrganizer ticketOrganizer);
  @GET("/my-tickets")
  Future<List<MeuIngressoBanner>> getTickets();
  @GET("/{id}")
  Future<TicketOutput> getTicket(@Path('id') String id);
  @PUT("/edit/{id}")
  Future<HttpResponse<void>> editTicket(
      @Path('id') String id, @Body() String nome, String cpf);
  @PUT("/transfer/{id}")
  Future<HttpResponse<void>> transferTicket(
      @Path('id') String id, @Body() String email);
}
