import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/data/models/vo/server.dart';

abstract interface class ApiServerDAO {
  Future<dynamic> getAuthor(Dto dto, ClientModel serverData);
}
