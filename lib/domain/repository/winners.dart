import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/dto/winners.dart';
import 'package:facetomini/domain/entities/vo/winners.dart';

abstract interface class WinnersRepository {
  // Get a winners
  Future<({WinnersEntity? data, Failure? fail})> getWinners(WinnersDTO dto);
}
