part of '../winners.dart';

/// Class for storing source data.
/// 1. Recorded in the page open request [getWinners].
/// 2. Used in the request to upload winners [getScrollData].
final class _Source {
  int idSource = 0;
  var type = TypeWinnersSource.series;
  void set({required int idSource, required TypeWinnersSource type}) {
    this.idSource = idSource;
    this.type = type;
  }
}
