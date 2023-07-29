part of '../puzzle.dart';

class _ActionMixData {
  /// Confusing and shuffling the puzzle
  List<int> mixData({required List<int> currentKeys, required int hardLevel, required int xCountCells, required int yCountCells}) {
    var mixKeysList = currentKeys.toList();
    // High difficulty - any mixing is available
    if (hardLevel == 1) {
      mixKeysList.shuffle();
      int middle = (mixKeysList.length / 2).round();
      int temp = 0;
      int n = 0;
      int z = Random().nextInt(3) + 1;
      for (int i = 0; i < middle - z; i++) {
        n = Random().nextInt(middle);
        temp = mixKeysList[middle + i];
        mixKeysList[middle + i] = mixKeysList[n];
        mixKeysList[n] = temp;
      }
    } else {
      // Low difficulty - only combinatorial mixing is available
      final combination = getMixPos(xCountCells: xCountCells, yCountCells: yCountCells);
      // Перетасовка по выбранной схеме
      int countShiftsRow = 0; // Number of iterations separately for row
      int countShiftsColumn = 0; // Number of iterations separately for column
      int useItemPos =
          0; // Shuffling position (if the shuffle position is greater than the positions in the frame (column): [useItemPos = useItemPos-xCount(yCount)];
      for (int i = 0; i < combination.countShift; i++) {
        // Randomly determining if a row or column will be shifted first
        if (Random().nextInt(2) == 0) {
          // This variant - is to first shift the row, then shift the column
          // 1. Shifts row
          useItemPos = (i <= (combination.rows.length - 1)) ? combination.rows[i] : 1;
          countShiftsRow = Random().nextInt(xCountCells - 1) + 1; // Random selection of the shift
          mixKeysList = shiftsRow(
            listKeys: mixKeysList,
            itemNumberRow: useItemPos,
            countShifts: countShiftsRow,
            xCountCells: xCountCells,
          );
          // 2. Shifts column
          useItemPos = (i <= (combination.columns.length - 1)) ? combination.columns[i] : 1;
          countShiftsColumn = Random().nextInt(yCountCells - 1) + 1; // Random selection of the shift
          mixKeysList = shiftsColumn(
            listKeys: mixKeysList,
            itemNumberColumn: useItemPos,
            countShifts: countShiftsColumn,
            xCountCells: xCountCells,
            yCountCells: yCountCells,
          );
        } else {
          // This variant - is to first shift the column, then shift the row
          // 1. Shifts column
          useItemPos = (i <= (combination.columns.length - 1)) ? combination.columns[i] : 1;
          countShiftsColumn = Random().nextInt(yCountCells - 1) + 1; // Random selection of the shift
          mixKeysList = shiftsColumn(
            listKeys: mixKeysList,
            itemNumberColumn: useItemPos,
            countShifts: countShiftsColumn,
            xCountCells: xCountCells,
            yCountCells: yCountCells,
          );

          // 2. Shifts row
          useItemPos = (i <= (combination.rows.length - 1)) ? combination.rows[i] : 1;
          countShiftsRow = Random().nextInt(xCountCells - 1) + 1; // Random selection of the shift
          mixKeysList = shiftsRow(
            listKeys: mixKeysList,
            itemNumberRow: useItemPos,
            countShifts: countShiftsRow,
            xCountCells: xCountCells,
          );
          mixKeysList = shiftsRow(
            listKeys: mixKeysList,
            itemNumberRow: useItemPos,
            countShifts: countShiftsRow,
            xCountCells: xCountCells,
          );
        }
      }
      print('Обычная сложность: $mixKeysList');
    }

    ///
    return mixKeysList;
  }

  /// Shift row
  /// itemNumberPosition - Ordinal row or column number
  /// countShifts - Required number of shifts
  List<int> shiftsRow({required List<int> listKeys, required int itemNumberRow, required int countShifts, required int xCountCells}) {
    if (countShifts == 0) return listKeys;
    int posStartList = itemNumberRow * xCountCells - xCountCells; // First position
    int posShift = 0;
    List bufferList = listKeys.getRange(posStartList, posStartList + xCountCells).toList();
    for (int i = 0; i < xCountCells; i++) {
      posShift = i + countShifts;
      if (posShift >= xCountCells) posShift = posShift - xCountCells; // 1,2,3,0
      listKeys[posStartList + posShift] = bufferList[i];
    }
    return listKeys;
  }

  /// Shift column
  /// itemNumberColumn - Ordinal row or column number
  /// countShifts - Required number of shifts
  List<int> shiftsColumn({
    required List<int> listKeys,
    required int itemNumberColumn,
    required int countShifts,
    required int xCountCells,
    required int yCountCells,
  }) {
    if (countShifts == 0) return listKeys;
    int posStartList = itemNumberColumn - 1;
    int startingPosition = 0;
    int posShift = 0;
    List bufferList = [];
    int square = xCountCells * yCountCells;

    for (int i = 0; i < yCountCells; i++) {
      bufferList.add(listKeys[posStartList + xCountCells * i]);
    }
    for (int i = 0; i < yCountCells; i++) {
      startingPosition = posStartList + (i * xCountCells);
      posShift = startingPosition + xCountCells * countShifts;
      if (posShift >= square) posShift = posShift - square; // 12,3,6,9
      listKeys[posShift] = bufferList[i];
    }
    return listKeys;
  }

  /// Method of obtaining combination obfuscation
  ({List<int> columns, List<int> rows, int countShift}) getMixPos({required int xCountCells, required int yCountCells}) {
    final columns = List.generate(xCountCells, (index) => index + 1);
    final rows = List.generate(yCountCells, (index) => index + 1);
    // Set how many shifts (shuffles) should be performed
    final countShift = max(xCountCells, yCountCells);
    columns.shuffle();
    rows.shuffle();
    return (columns: columns, rows: rows, countShift: countShift);
  }
}
