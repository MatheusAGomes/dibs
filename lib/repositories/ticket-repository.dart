import 'package:dibs/models/meuIngressoBanner.dart';
import 'package:dibs/models/ticketClientInput.dart';
import 'package:dibs/models/ticketOrganizer.dart';
import 'package:dibs/models/ticketsForSale.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/modeloRespostaEditTicket.dart';
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
  Future<HttpResponse<void>> editTicket(@Path('id') String id,
      @Body() ModeloRespostaEditTicket respostaEditTicket);
  @PUT("/transfer/{id}")
  Future<HttpResponse<void>> transferTicket(
      @Path('id') String id, @Body() String email);
  @GET("/announced-tickets/{id}")
  Future<List<TicketForSale>> getTicketForSale(@Path('id') String idDoEvento);
  @POST("/buy/client")
  Future<HttpResponse<void>> buyTicketFromClient(
      @Body() TicketClientInput ticketOrganizer);
  @PUT("/announce/{id}")
  Future<HttpResponse<void>> announceTicket(
      @Path('id') String idDoEvento, @Body() double price);
  @PUT("/remove-announce/{ticketId")
  Future<HttpResponse<void>> removeAnnounceTicket(
      @Path('ticketId') String idDoEvento);
  @GET("/sold-tickets")
  Future<List<MeuIngressoBanner>> getSoldTickets();
}
