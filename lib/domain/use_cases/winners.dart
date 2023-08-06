import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/dto/winners.dart';
import 'package:facetomini/domain/entities/vo/winners.dart';
import 'package:facetomini/domain/repository/winners.dart';

final class WinnersCase implements WinnersRepository {
  WinnersCase(this._winnersRepository);
  final WinnersRepository _winnersRepository;

  @override
  Future<({WinnersEntity? data, Failure? fail})> getWinners(WinnersDTO dto) async {
    final response = await _winnersRepository.getWinners(dto);
    return response;
  }
}
