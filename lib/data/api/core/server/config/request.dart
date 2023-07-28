import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:facetomini/core/config/actions.dart';
import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/data/models/vo/server.dart';

/// Class for forming a request object and making requests to the server
final class ConfigRequestServer {
  // Makes a request to the server
  static Future<Map<String, dynamic>?> request(Dio apiServer, Dto dto, ClientModel serverData) async {
    final response = await apiServer.post(
      ConfigActionsApi.linkServer,
      options: Options(headers: {'Accept': 'application/json'}),
      data: _formDataObject(dto, serverData),
    );
    _checkResponse(response);
    if (response.data == null || response.data.toString().isEmpty) return null;
    return jsonDecode(response.data);
  }

  // Forming a data object for a request
  static FormData _formDataObject(Dto dto, ClientModel serverData) {
    return FormData.fromMap({
      "data": jsonEncode({
        ...dto.toMapRequest(),
        'id_app': serverData.idApp,
        'public_key': serverData.publicKey,
        'lang': serverData.language,
        'timezoneOffset': DateTime.now().timeZoneOffset.inSeconds,
      })
    });
  }

  // Checking Server Response Codes
  static void _checkResponse(Response response) {
    if (response.statusCode != 200) throw ApiException("${response.statusMessage}");
  }
}
