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
