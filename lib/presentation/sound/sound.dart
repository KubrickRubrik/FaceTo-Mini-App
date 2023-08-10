// import 'package:audioplayers/audioplayers.dart';

final class SoundController {
  // final player = AudioPlayer();
  bool playSound = true;

  // Sounds
  final _listSound = [
    _ItemSound('introSeries', '../asset/app/sound/series.mp3'),
    _ItemSound('introScenes', '../asset/app/sound/scenes.mp3'),
    _ItemSound('introScene', '../asset/app/sound/scene.mp3'),
    _ItemSound('introWinner', '../asset/app/sound/winner.mp3'),
    _ItemSound('actionBack', '../asset/app/sound/back.mp3'),
    _ItemSound('actionShift', '../asset/app/sound/shift.mp3'),
  ];

  Future<void> init() async {}

  // PlayList
  // await player.play(AssetSource(_listSound[0].source), mode: PlayerMode.lowLatency);
  Future<void> playSeries() async => playSound ? print('play ${_listSound[0].title}') : print('silence');
  // await player.play(AssetSource(_listSound[1].source), mode: PlayerMode.lowLatency);
  Future<void> playScenes() async => playSound ? print('play ${_listSound[1].title}') : print('silence');
  // await player.play(AssetSource(_listSound[2].source), mode: PlayerMode.lowLatency);
  Future<void> playScene() async => playSound ? print('play ${_listSound[2].title}') : print('silence');
  // await player.play(AssetSource(_listSound[3].source), mode: PlayerMode.lowLatency);
  Future<void> playWinner() async => playSound ? print('play ${_listSound[3].title}') : print('silence');
  // await player.play(AssetSource(_listSound[4].source), mode: PlayerMode.lowLatency);
  Future<void> playBack() async => playSound ? print('play ${_listSound[4].title}') : print('silence');
  // await player.play(AssetSource(_listSound[5].source), mode: PlayerMode.lowLatency);
  Future<void> playShift() async => playSound ? print('play ${_listSound[5].title}') : print('silence');

  void setSound(bool isSound) => playSound = isSound;
}

final class _ItemSound {
  _ItemSound(this.title, this.source);
  final String title;
  final String source;
}
