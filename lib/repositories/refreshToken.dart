import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/constance/environment.dart';

part 'refreshToken.g.dart';

@RestApi(baseUrl: "${Environment.BASE_URL}users/refresh-token")
abstract class RefreshApi {
  factory RefreshApi(Dio dio, {String baseUrl}) = _RefreshApi;

  @POST("")
  Future<HttpResponse<void>> refreshToken();
}




