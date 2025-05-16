import 'dart:convert';

import 'package:ct_kor_chok_dee_app/data/models/students_model.dart';
import 'package:ct_kor_chok_dee_app/utils/api_handler.dart';
import 'package:http/http.dart' as http;

class HomeProvider {
  var client = http.Client();

  Future<List<StudentsModel>> getUsers({String? name}) async {
    String uri = 'http://192.168.100.13:3001/students';

    final response = await client.get(Uri.parse(uri));

    ApiErrorHandler.handleResponse(response);

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((item) => StudentsModel.fromJson(item)).toList();
  }
}
