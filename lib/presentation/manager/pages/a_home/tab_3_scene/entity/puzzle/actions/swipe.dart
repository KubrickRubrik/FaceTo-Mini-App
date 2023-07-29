part of '../puzzle.dart';

class _ActionAxisSwipe {
  // int _maxDeg = 1;
  // int _minDeg = 0;
  // // int _limits = 25;
  // int _limits = 15;

  ///
  double _checkStart_x = 0;
  double _checkStart_y = 0;
  double _checkEnd_x = 0;
  double _checkEnd_y = 0;

  ///
  int yPosRow = 0; // начальные координаты рядка по которому произошел свайп
  int xPosColumn = 0; // насальные координаты столбца по которому произошел свайп
  int numRow = 0;
  int numColumn = 0;
  int numDiagonal = 0;

  ///
  AxisVectorTypeSwipe axisVectorTypeSwipe = AxisVectorTypeSwipe();

  /// Установка предела углов для диагонального свайпа
  ({int maxAngle, int minAnle}) getConstraintRangeDiagonalSwipe({required double catetX, required double catetY, required int rangeAngle}) {
    double deg = getDeg(catetX, catetY);
    _maxDeg = (deg + _limits).ceil();
    _minDeg = (deg - _limits).ceil();
    print("Уголо наклона unita: $deg; lim-Вертикаль: $_maxDeg; lim-Горизонталь: $_minDeg");
    degNorm = deg;
  }

  /// Установка начальных координат
  setStartCoord(double _x_coord, double _y_coord) {
    _checkStart_x = getNumRound(_x_coord);
    _checkStart_y = getNumRound(_y_coord);
    xPosColumn = _x_coord.ceil();
    yPosRow = _y_coord.ceil();
  }

  setEndCoord(double _x_coord, double _y_coord) {
    _checkEnd_x = getNumRound(_x_coord);
    _checkEnd_y = getNumRound(_y_coord);
  }

  double degNorm = 0;

  //! Num round 2 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  double getDeg(double _catet_x, double _catet_y) {
    double deg = getNumRound(_catet_y / _catet_x);
    deg = getNumRound(atan(deg));
    deg = getNumRound(deg * 57.2958);

    print("Угол свайпа: $deg | Norm-наклон: $degNorm | lim-Вертикаль: $_maxDeg | lim-Горизонталь: $_minDeg");
    return deg;
  }

  /// Rounding to a certain precision
  double getNumRound(double num) => double.parse(num.toStringAsFixed(2));

  ///
  ///
  //! GET TYPE COORD AXIS & VECTOR >>>>>>>>>>>>>>>>>>>
  /// Получение Axis и Vector
  ///
  Future<void> setTypeVectorAxis() async {
    double vector_x = _checkEnd_x - _checkStart_x; // для определения типа вектора (направления свайпа)
    double vector_y = _checkEnd_y - _checkStart_y; // для определения типа вектора (направления свайпа)
    double _catet_x = (vector_x != 0) ? vector_x.abs() : 1;
    double _catet_y = vector_y.abs();
    //
    int _degSwipe = getDeg(_catet_x, _catet_y).ceil();
    //
    //! Vertical
    if (_degSwipe > _maxDeg) {
      axisVectorTypeSwipe.axis = Direction.vertical;
      if (vector_y >= 0)
        axisVectorTypeSwipe.vector = Vector.down;
      else
        axisVectorTypeSwipe.vector = Vector.up;
    }
    //! Horisontal
    else if (_degSwipe < _minDeg) {
      axisVectorTypeSwipe.axis = Direction.horisontal;
      if (vector_x >= 0)
        axisVectorTypeSwipe.vector = Vector.right;
      else
        axisVectorTypeSwipe.vector = Vector.left;
    }
    //! Diagonal
    else {
      axisVectorTypeSwipe.axis = Direction.diagonal;
      //! TO DOWN
      if (vector_y >= 0) {
        //! TO RIGHT
        if (vector_x >= 0)
          axisVectorTypeSwipe.vector = Vector.downRight;
        //! TO LEFT
        else
          axisVectorTypeSwipe.vector = Vector.downLeft;
      }
      //! TO UP
      else {
        //! TO RIGHT
        if (vector_x >= 0)
          axisVectorTypeSwipe.vector = Vector.upRight;
        //! TO LEFT
        else
          axisVectorTypeSwipe.vector = Vector.upLeft;
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
