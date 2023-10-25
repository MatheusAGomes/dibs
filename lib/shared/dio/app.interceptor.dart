import 'package:dio/dio.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import '../../models/auth.dart';
import '../constance/environment.dart';
import '../routes/routes.dart';
import '../service/toastService.dart';

import '../store.dart';

class AppInterceptors extends Interceptor {
//  BuildContext? context;
  var controladorReq = 0;
  AppInterceptors();

  void verificaControlador() {
    controladorReq--;
    if (controladorReq == 0) {
      Routes.navigatorKey.currentContext!.loaderOverlay.hide();
    }
  }

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler interceptorHandler) async {
    controladorReq++;
    Routes.navigatorKey.currentContext!.loaderOverlay.show();
    Auth auth = Provider.of(Routes.navigatorKey.currentContext!, listen: false);

    final token = auth.token;
    if (token != null && options.baseUrl.contains(Environment.BASE_URL)) {
      options.headers['Authorization'] = token;
    }

    return interceptorHandler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    verificaControlador();

    return handler.next(response);
  }

  @override
  void onError(DioError dioError,
      ErrorInterceptorHandler errorInterceptorHandler) async {
    verificaControlador();
    String error = '';
    if (dioError.response != null) {
      final statusCode = dioError.response!.statusCode;

      switch (statusCode) {
        case 403:
          {
            if (dioError.requestOptions.baseUrl.contains('/login')) {
              if (dioError.response!.headers.value('invalid-reason')!.isEmpty) {
                error = 'Usuário ou senha inválidos';
              } else {
                error = dioError.response!.headers
                    .value('invalid-reason')
                    .toString();
              }
            }
          }
          break;

        case 417:
          {
            if (dioError.response!.requestOptions.path
                .contains('/forgot-password/reset')) {
              error =
                  'Código inválido. Solicite uma nova recuperação de senha e tente novamente';
            }
          }
          break;
        default:
          {
            final data = dioError.response!.data;
            error = 'Houve um erro. Por favor, teste novamente';

            try {
              if (data.containsKey('userMessage') &&
                  data.containsKey('objects')) {
                int i = 0;
                error = '';
                for (i = data['objects'].length - 1; i >= 0; i--) {
                  error += data['objects'][i]['userMessage'];
                  if (i != 0) {
                    error += "\n";
                  }
                }
                // error += data['userMessage'];
              }
            } catch (e) {}
          }
          break;
      }
    } else {
      error = 'Houve um erro. Por favor, teste novamente';
    }

    ToastService.showToastError(error);

    return errorInterceptorHandler.next(DioError(
        requestOptions: dioError.requestOptions,
        response: dioError.response,
        type: dioError.type,
        error: error));
  }
}
