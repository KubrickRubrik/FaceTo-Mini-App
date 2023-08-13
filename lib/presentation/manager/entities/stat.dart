import 'dart:math';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/domain/entities/vo/winners.dart';

final class InfoStatData {
  final min = MinMidMax();
  final mid = MinMidMax();
  final max = MinMidMax();
  final graph = Graph();
  // Char
  int publicState = 0;

  void set(StatAllChampionsEntity data) {
    min.set(data.min);
    mid.set(data.mid);
    max.set(data.max);
    graph.set(data.graph);
    final v = _prepareDataGraph();
    publicState = (v == null) ? 0 : v;
  }

  // Prepare a data graph
  int? _prepareDataGraph() {
    if ([
      min.time,
      min.swipe,
      mid.time,
      mid.swipe,
      max.time,
      max.swipe,
    ].contains(0)) return null;
    // Calculation of the scale factor to bring the leg
    // of time into the same scale with the leg of the swipes
    // The degree of scaling for the x-axis based on the data of the y-axis
    final powNum = graph.yAxis.maxLimit.ceil().toString().length;
    final powX = (max.time - min.time).toString().length;
    final scale = pow(10, (powX - powNum)).ceil(); // scale
    final pubCatetX = ((max.time - min.time) / scale).ceil().abs(); // scaled leg
    final pubCatetY = (max.swipe - min.swipe).ceil().abs();
    //
    if (pubCatetX == 0 || pubCatetY == 0) return null;
    final pubMidX = (pubCatetX / 2).ceil();
    final unitH = (pubCatetY / 5).ceil();
    //
    final deg = ConfigNumbers.getNumRound(pubCatetY / pubCatetX);
    //
    print("Scale: $scale");
    print("Leg Y: $pubCatetY");
    print("Leg X: $pubCatetX");
    print("Corner : $deg");
    print("Middle: $pubMidX");
    print("Cell height: $unitH");
    //
    // final spotMidPubTimeY = (mid.time / scale).ceil().abs();
    // final spotMidPubSwipeX = mid.swipe;
    //
    //? Characteristics of the players
    publicState = _setPublicState(scale, deg, pubMidX, unitH);
    return publicState;
  }

  //
  int _setPublicState(int scale, double deg, int pubMidX, int unitH) {
    int publicState = 0;
    if (mid.time < min.time || mid.swipe < min.swipe || mid.time > max.time || mid.swipe > max.swipe) {
      // If the majority does not fall within the chart, zone 1, 2, 3, 4, 5, 6, 7, 8
      if (min.swipe >= max.swipe) {
        // Graph left-sided
        if (mid.time < min.time) {
          // Zone 1, 7, 8
          if (mid.swipe < min.swipe) {
            // Zone  7
            publicState = 4;
          } else {
            // Zone  1, 8
            publicState = 1;
          }
        } else if (mid.time > max.time) {
          // Zone  3, 4, 5
          if (mid.swipe < max.swipe) {
            // Zone 4, 5
            publicState = 3;
          } else {
            // Zone 3
            publicState = 2;
          }
        } else if (mid.swipe < min.swipe) {
          // Zone  6
          publicState = 3;
        } else {
          // Zone  2
          publicState = 1;
        }
      } else {
        // Right hand chart
        if (mid.time < min.time) {
          // Zone  1, 7, 8
          if (mid.swipe < min.swipe) {
            // Zone  7, 8
            publicState = 3;
          } else {
            // Zone  1
            publicState = 4;
          }
        } else if (mid.time > max.time) {
          // Zone  3, 4, 5
          if (mid.swipe < max.swipe) {
            // Zone 3, 4,
            publicState = 1;
          } else {
            // Zone 5
            publicState = 2;
          }
        } else if (mid.swipe < min.swipe) {
          // Zone  6
          publicState = 3;
        } else {
          // Zone  2
          publicState = 1;
        }
      }
    } else {
      // If the majority falls within the graph
      final pubCatMidX = ((mid.time - min.time) / scale).ceil();
      final pubCatMidY = (mid.swipe - min.swipe).ceil();
      // Projecting onto the X diagonal and getting the height from X to the diagonal in pubCatMidY
      final proectPubCatMidY = ConfigNumbers.getNumRound(pubCatMidX * deg).ceil();
      // The difference between the Y leg for Mid and the catheter projection on the diagonal
      final deltaHMid = (pubCatMidY - proectPubCatMidY);
      // print("$pubCatMidX * tan $deg ");
      // print("-----");
      // print("Leg mid X: $pubCatMidX");
      // print("Leg mid Y: $pubCatMidY");
      // print("Leg projection: $proectPubCatMidY");
      // print("Delta: $deltaHMid");
      if (pubCatMidX <= pubMidX) {
        // Zone  1,3,4

        if (deltaHMid.abs() > unitH) {
          if (deltaHMid > 0) {
            publicState = 1;
          } else {
            publicState = 3;
          }
        } else {
          publicState = 4;
        }
      } else {
        // Zone  1,2,3
        if (deltaHMid.abs() > unitH) {
          if (deltaHMid > 0) {
            publicState = 1;
          } else {
            publicState = 3;
          }
        } else {
          publicState = 2;
        }
      }
    }
    return publicState;
  }

  // Clear data stat
  void clear() {
    min.clear();
    mid.clear();
    max.clear();
    graph.clear();
    publicState = 0;
  }
}

/// A class for storing the value of the winners' scores.
final class MinMidMax {
  double swipe = 0;
  int time = 0;

  void set(MinMidMaxEntity data) {
    swipe = data.swipe;
    time = data.time;
  }

  void clear() {
    swipe = 0;
    time = 0;
  }
}

/// Chart indicators
final class Graph {
  int countUsersMin = 0;
  int countUsersMax = 0;
  int countUsers = 0;
  //
  int flexLeft = 0;
  int flexRight = 0;
  //
  final userStat = UserGraphStat();
  int userState = 0;
  int userTime = 0;
  int userCountSwipe = 0;
  //
  GAxis xAxis = GAxis();
  GAxis yAxis = GAxis();

  void set(GraphEntity data) {
    countUsersMin = data.countUsersMin;
    countUsersMax = data.countUsersMax;
    countUsers = data.countUsers;
    //
    userStat.set(data.userStat);
    //
    flexLeft = data.flexLeft;
    flexRight = data.flexRight;
    //
    xAxis.set(data.xAxis);
    yAxis.set(data.yAxis);
  }

  void clear() {
    countUsersMin = 0;
    countUsersMax = 0;
    userState = 0;
    flexLeft = 0;
    flexRight = 0;
  }
}

final class UserGraphStat {
  int userState = 0;
  int userTime = 0;
  int userCountSwipe = 0;

  void set(UserGraphStatEntity data) {
    userState = data.userState;
    userTime = data.userTime;
    userCountSwipe = data.userCountSwipe;
  }

  void clear() {
    userState = 0;
    userTime = 0;
    userCountSwipe = 0;
  }
}

final class GAxis {
  int interval = 0;
  int minLimit = 0;
  int maxLimit = 1;

  void set(GAxisEntity data) {
    interval = data.interval;
    minLimit = data.minLimit;
    maxLimit = data.maxLimit;
  }
}
