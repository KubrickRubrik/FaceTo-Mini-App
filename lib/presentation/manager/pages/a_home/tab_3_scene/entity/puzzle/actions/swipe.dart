part of '../puzzle.dart';

/// Class for working with axes and swipe directions
class _ActionAxisSwipe {
  // double _checkStartX = 0; // стартовые координаты свайпа
  // double _checkStartY = 0; // стартовые координаты свайпа
  // double _checkEndX = 0;
  // double _checkEndY = 0;

  ///

  int numRow = 0;
  int numColumn = 0;
  int numDiagonal = 0;

  ///
  AxisVectorTypeSwipe axisVectorTypeSwipe = AxisVectorTypeSwipe();

  /// Defining the angle range of a diagonal swipe
  ({int maxAngle, int minAnle}) getConstraintRangeDiagonalSwipe({required double catetX, required double catetY, required int rangeAngle}) {
    double deg = _getAngleSwipe(catetX: catetX, catetY: catetY);
    final maxAngle = (deg + rangeAngle).ceil();
    final minAnle = (deg - rangeAngle).ceil();
    return (maxAngle: maxAngle, minAnle: minAnle);
  }

  /// Getting the angle of the swipe (the angle between the hypotenuse and the lower leg)
  double _getAngleSwipe({required double catetX, required double catetY}) {
    double deg = ConfigNumbers.getNumRound(catetY / catetX);
    deg = ConfigNumbers.getNumRound(atan(deg));
    deg = ConfigNumbers.getNumRound(deg * 57.2958);
    return deg;
  }

  /// GET TYPE COORD AXIS & VECTOR
  Future<void> setTypeVectorAxis({
    required _DataCoord startCoord,
    required _DataCoord endCoord,
    required int maxAngle,
    required int minAnle,
  }) async {
    final vectorX = endCoord.coordX - startCoord.coordX; // To determine the horizontal direction of the swipe
    double vectorY = endCoord.coordY - startCoord.coordY; // To determine the vertical direction of the swipe
    double catetX = (vectorX != 0) ? vectorX.abs() : 1;
    double catetY = vectorY.abs();
    //
    final degSwipe = _getAngleSwipe(catetX: catetX, catetY: catetY).ceil();
    //? Vertical
    if (degSwipe > maxAngle) {
      axisVectorTypeSwipe.axis = Direction.vertical;
      if (vectorY >= 0) {
        axisVectorTypeSwipe.vector = Vector.down;
      } else {
        axisVectorTypeSwipe.vector = Vector.up;
      }
    }
    //? Horisontal
    else if (degSwipe < minAnle) {
      axisVectorTypeSwipe.axis = Direction.horisontal;
      if (vectorX >= 0) {
        axisVectorTypeSwipe.vector = Vector.right;
      } else {
        axisVectorTypeSwipe.vector = Vector.left;
      }
    }
    //? Diagonal
    else {
      axisVectorTypeSwipe.axis = Direction.diagonal;
      //? TO DOWN
      if (vectorY >= 0) {
        //? TO RIGHT
        if (vectorX >= 0) {
          axisVectorTypeSwipe.vector = Vector.downRight;
        } else {
          axisVectorTypeSwipe.vector = Vector.downLeft;
        }
      }
      //? TO UP
      else {
        //? TO RIGHT
        if (vectorX >= 0) {
          axisVectorTypeSwipe.vector = Vector.upRight;
        } else {
          axisVectorTypeSwipe.vector = Vector.upLeft;
        }
      }
    }
  }
}

/// Определение типа свайпа: horisontal, vertical, diagonal
/// Определение типа вектора: влево, вправо, вверх, вниз
///
class AxisVectorTypeSwipe {
  Direction axis = Direction.horisontal; // указатель горизонтального, вертикального или диагонального свайпа
  Vector vector = Vector.left; // указатель направления свайпа
}

///
enum Direction { horisontal, vertical, diagonal }

enum Vector { left, right, up, down, upLeft, upRight, downLeft, downRight }
