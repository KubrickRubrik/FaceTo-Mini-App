// import 'dart:developer';
import 'dart:developer';

import 'package:audio_in_app/audio_in_app.dart';

final class SoundController {
  final _audioInApp = AudioInApp();
  // Sounds
  final _listSound = [
    _ItemSound('introSeries', '../asset/app/sound/series.mp3'),
    _ItemSound('introScenes', '../asset/app/sound/scenes.mp3'),
    _ItemSound('introScene', '../asset/app/sound/scene.mp3'),
    _ItemSound('introWinner', '../asset/app/sound/winner.mp3'),
    _ItemSound('actionBack', '../asset/app/sound/back.mp3'),
    _ItemSound('actionShift', '../asset/app/sound/shift.mp3'),
  ];

  Future<void> init() async {
    for (var sound in _listSound) {
      await _audioInApp.createNewAudioCache(
        playerId: sound.title,
        route: sound.source,
        audioInAppType: AudioInAppType.determined,
      );
    }

    log(_audioInApp.audioCacheMap.toString(), name: 'LoadingActivity');
  }

  Future<void> playSeries() async => _audioInApp.play(playerId: _listSound[0].title);
  Future<void> playScenes() async => _audioInApp.play(playerId: _listSound[1].title);
  Future<void> playScene() async => _audioInApp.play(playerId: _listSound[2].title);
  Future<void> playWinner() async => _audioInApp.play(playerId: _listSound[3].title);
  Future<void> playBack() async => _audioInApp.play(playerId: _listSound[4].title);
  Future<void> playShift() async => _audioInApp.play(playerId: _listSound[5].title);

  void setSound(bool isSound) => _audioInApp.audioPermissionUser = isSound;
}

final class _ItemSound {
  _ItemSound(this.title, this.source);
  final String title;
  final String source;
}
