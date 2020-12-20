import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:just_audio/just_audio.dart';

import 'package:muze/modules/song.dart';
import 'package:get/get.dart';

class SongPlayerController extends GetxController {
  AudioPlayer player;
  bool isPlaying = false.obs();
  bool isFavorite = false.obs();
  bool isShuffle = false.obs();
  bool isRepeat = false.obs();
  Song currentSong;
  int currentSongIndex = 0.obs();
  List<Song> allSongs;

  Future musicStart(Song file) async {
    if (file.path != null) {
      currentSong = file;
      player = AudioPlayer();
      var duration = player.setFilePath(currentSong.path);

      play();
      // currentSong = file;
      // print(currentSong.path);
      // print('path from music start');
    }
  }

  void songPlayPauseRegulator(Song song) async {
    // final player = AudioPlayer();
    if (currentSong?.path == null) {
      await musicStart(song);

      setIsPlaying(true);
    } else if (currentSong.path == song.path) {
      isPlaying ? pause() : play();
      print('null path : ${currentSong.path}');
    } else if (currentSong.path != song.path) {
      player.dispose();
      await musicStart(song);
      setIsPlaying(true);
    }
    update();
  }

  Future<void> disposePlayer() async {
    try {
      await player.dispose();
    } catch (e) {
      print(e);
    }
    setIsPlaying(false);

    update();
  }

  void setIsPlaying(bool val) {
    isPlaying = val;
    update();
  }

  Future<void> play() async {
    setIsPlaying(true);
    player.play();
  }

  Future<void> pause() async {
    setIsPlaying(false);
    player.pause();
  }

  static SongPlayerController get to => Get.find<SongPlayerController>();
}
