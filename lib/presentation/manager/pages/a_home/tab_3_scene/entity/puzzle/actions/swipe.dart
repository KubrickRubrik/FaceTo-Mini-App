part of '../puzzle.dart';

/// Class for calculating the type and direction of the performed swipe
abstract final class _ActionSwipe {
  /// Class for calculating the type, direction and other data of the performed swipe
  static ({int maxAngle, int minAnle}) getConstraintRangeDiagonalSwipe({
    required double catetX,
    required double catetY,
    required int rangeAngle,
  }) {
    double deg = _getAngleSwipe(catetX: catetX, catetY: catetY);
    final maxAngle = (deg + rangeAngle).ceil();
    final minAnle = (deg - rangeAngle).ceil();
    return (maxAngle: maxAngle, minAnle: minAnle);
  }

  /// Getting the angle of the swipe (the angle between the hypotenuse and the lower leg)
  static double _getAngleSwipe({required double catetX, required double catetY}) {
    double deg = ConfigNumbers.getNumRound(catetY / catetX);
    deg = ConfigNumbers.getNumRound(atan(deg));
    deg = ConfigNumbers.getNumRound(deg * 57.2958);
    return deg;
  }

  /// Swipe type and direction calculations
  static SwipeData getDataSwipe({
    required _DataCoord startCoord,
    required _DataCoord endCoord,
    required int maxAngle,
    required int minAnle,
  }) {
    final vectorX = endCoord.coordX - startCoord.coordX; // To determine the horizontal direction of the swipe
    final vectorY = endCoord.coordY - startCoord.coordY; // To determine the vertical direction of the swipe
    final double catetX = (vectorX != 0) ? vectorX.abs() : 1;
    final double catetY = vectorY.abs();
    final swipeData = SwipeData();
    //
    final degSwipe = _getAngleSwipe(catetX: catetX, catetY: catetY).ceil();
    //? Vertical
    if (degSwipe > maxAngle) {
      swipeData.axis = TypeAxisSwipe.vertical;
      if (vectorY >= 0) {
        swipeData.direction = DirectionSwipe.down;
      } else {
        swipeData.direction = DirectionSwipe.up;
      }
    }
    //? Horisontal
    else if (degSwipe < minAnle) {
      swipeData.axis = TypeAxisSwipe.horisontal;
      if (vectorX >= 0) {
        swipeData.direction = DirectionSwipe.right;
      } else {
        swipeData.direction = DirectionSwipe.left;
      }
    }
    //? Diagonal
    else {
      swipeData.axis = TypeAxisSwipe.diagonal;
      //? TO DOWN
      if (vectorY >= 0) {
        //? TO RIGHT
        if (vectorX >= 0) {
          swipeData.direction = DirectionSwipe.downRight;
        } else {
          swipeData.direction = DirectionSwipe.downLeft;
        }
      }
      //? TO UP
      else {
        //? TO RIGHT
        if (vectorX >= 0) {
          swipeData.direction = DirectionSwipe.upRight;
        } else {
          swipeData.direction = DirectionSwipe.upLeft;
        }
      }
    }
    return swipeData;
  }
}
