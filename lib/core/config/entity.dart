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
  isNoContent,
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
