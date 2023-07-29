part of '../puzzle.dart';

/// A class for storing the correct (for winning) and playing puzzle keys
final class _KeysPuzzle {
  // The unique key of a correctly folded puzzle;
  // Used to check against the key folded by the user to determine victory
  String _correctKeysPuzzleWin = '';
  // Game keys that the user folds during the game
  final _currentGameListKeysPuzzleWin = <int>[];

  /// Set default parameters for start new game
  setDefaultParameters(String grid) {
    // Formation of the correct scene key. The user wins if [_currentGameKeysPuzzleWin] == [countKeysGrid]
    final countKeysGrid = grid.split('x').map((e) => int.parse(e)).reduce((xCount, yCount) => xCount * yCount);
    _correctKeysPuzzleWin = List.generate(countKeysGrid, (index) => index + 1).join('-');
  }

  /// Checking the correct key and the key generated by the user after each swipe
  bool isKeysPuzzleEqual() => _correctKeysPuzzleWin == _currentGameListKeysPuzzleWin.join('-');

  ///! Setting game launch state
  void setGameLaunchState(String grid) {
    final countKeysGrid = grid.split('x').map((e) => int.parse(e)).reduce((xCount, yCount) => xCount * yCount);
    _currentGameListKeysPuzzleWin.clear();
    _currentGameListKeysPuzzleWin.addAll(List.generate(countKeysGrid, (index) => index + 1));
  }

  /// Rewriting the list of keys of the current game with the same list, but confusing depending on the difficulty level
  void mixCurrentKeys(List<int> listMixKeys) {
    _currentGameListKeysPuzzleWin.clear();
    _currentGameListKeysPuzzleWin.addAll(listMixKeys);
  }
}
