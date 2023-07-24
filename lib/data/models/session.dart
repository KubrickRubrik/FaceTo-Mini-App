class SessionModel {
  final int idApp;
  final int enabledSound;
  final String language;
  final String theme;

  SessionModel({
    required this.idApp,
    required this.enabledSound,
    required this.language,
    required this.theme,
  });
  SessionModel.settings({
    this.idApp = 0,
    this.enabledSound = 0,
    this.language = '',
    this.theme = '',
  });
}
