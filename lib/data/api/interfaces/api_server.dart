import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/data/models/vo/author.dart';
import 'package:facetomini/data/models/vo/server.dart';
import 'package:facetomini/data/models/vo/stat_puzzle.dart';
import 'package:facetomini/data/models/vo/winners.dart';
import 'package:facetomini/domain/entities/dto/winners.dart';

abstract interface class ApiServerDAO {
  /// Request for series author data. or scenes
  Future<AuthorModel?> getAuthor(Dto dto, ClientModel serverData);

  /// Scene winner data request
  Future<PuzzleUpdatesModel?> getPuzzleStatistics(Dto dto, ClientModel serverData);

  /// Request series or scene winners
  Future<WinnersModel?> getWinners(WinnersDTO dto, ClientModel serverData);
}
