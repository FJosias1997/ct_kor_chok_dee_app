import 'dart:convert';
import 'package:ct_kor_chok_dee_app/data/models/api_exception_model.dart';
import 'package:http/http.dart' as http;

class ApiErrorHandler {
  static void handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) return;

    final data = jsonDecode(response.body);

    try {
      throw ApiException(
        statusCode: response.statusCode,
        message: data['message'] ?? 'Erro desconhecido',
        detailedMessage: data['detailedMessage'],
        prologErrorCode: data['proLogErrorCode'],
      );
    } catch (e) {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'Erro inesperado ao processar resposta do servidor',
        detailedMessage: data['detailedMessage'],
      );
    }
  }
}
