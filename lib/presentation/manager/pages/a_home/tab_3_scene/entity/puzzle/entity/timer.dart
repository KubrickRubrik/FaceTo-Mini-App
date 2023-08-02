part of '../puzzle.dart';

/// Class for tracking the time of puzzle folding
final class _TimerGame {
  final timer = Stopwatch();

  void start() => timer.start();
  int stop() {
    timer.stop();
    final result = timer.elapsedMilliseconds;
    timer.reset();
    return result;
  }
}
