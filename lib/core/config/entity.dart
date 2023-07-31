/// Session state of the application/user
enum StateApp { errorRepairs, isAuth, isNotAuth }

/// Available interface themes for selection in the application
enum CurrentThemeApp { light, dark }

/// Available languages for selection in the app
enum AvailableAppLocale { ru, en }

/// Activity activity status
enum ActionStatus { isAction, isDone }

/// Page loading status
enum StatusContent {
  isLoadContent,
  isNoneContent,
  isEmptyContent,
  isViewContent,
}

/// Image source
enum TypeSourceImage { server, file, asset }

/// Target image source
enum TargetSourceImage { app, series, scenes }

/// To determine if it was worth caching an image from the Internet
enum TypeCacheImage { cache, notCache }

/// Type of toast
enum TypeMassage { massage, error, warning }

/// Winners section download source
enum TypeSourceWinner { offline, online }

/// Different types of puzzle cell list
enum TypeListCellsPuzzle {
  main,
  topSide,
  bottomSide,
  leftSide,
  rightSide,
  leftTopDiagonal,
  leftBottomDiagonal,
  rightTopDiagonal,
  rightBottomDiagonal,
}

/// Swipe puzzle type
enum TypeAxisSwipe { horisontal, vertical, diagonal }

/// Swipe vector/direction
enum DirectionSwipe { left, right, up, down, upLeft, upRight, downLeft, downRight }
