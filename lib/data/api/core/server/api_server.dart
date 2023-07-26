import 'package:dio/dio.dart';
import 'package:facetomini/core/config/actions.dart';
import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/data/models/vo/server.dart';

class ApiServer implements ApiServerDAO {
  final dio = Dio();

  @override
  Future getAuthor(Dto dto, ClientModel serverData) async {
    try {
      final data = _formDataObject(dto, serverData);
      final response = await dio.post(ConfigActionsApi.linkServer, data: data);
      _checkResponse(response);
      return response.data;
    } catch (e) {
      throw ApiException('Exception api server dio: $e');
    }
  }

  // Forming a data object for a request
  Map<String, dynamic> _formDataObject(Dto dto, ClientModel serverData) {
    return {
      ...dto.toMapRequest(),
      'id_app': serverData.idApp,
      'public_key': serverData.publicKey,
      'lang': serverData.language,
      'timezoneOffset': DateTime.now().timeZoneOffset.inSeconds,
    };
  }

  // Checking Server Response Codes
  void _checkResponse(Response response) {
    if (response.statusCode != 200) throw ApiException("${response.statusMessage}");
  }
}
