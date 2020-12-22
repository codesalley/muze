import 'dart:core';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:just_audio/just_audio.dart';

import 'package:get/get.dart';
import 'package:muze/models/song.dart';

class SongPlayerController extends GetxController {
  AudioPlayer player;
  var isPlaying = false.obs();
  var isFavorite = false.obs();
  var isShuffle = false.obs();
  var isRepeat = false.obs();
  Song currentSong;
  var currentSongIndex = 0.obs();
  List<Song> allSongs = [].obs();

  Future musicStart(Song song) async {
    // print(file.path);
    if (song.path != null) {
      currentSong = song;
      player = AudioPlayer();
      currentSongIndex =
          allSongs.indexWhere((element) => element.path == currentSong.path);
      var duration = player.setFilePath(song.path);

      play();
      update();
    }
  }

  void songPlayPauseRegulator(Song playList) async {
    // final player = AudioPlayer();
    if (currentSong.path == null) {
      await musicStart(playList);

      setIsPlaying(true);
    } else if (currentSong.path == playList.path) {
      isPlaying ? pause() : play();
    } else if (currentSong.path != playList.path) {
      disposePlayer();
      await musicStart(playList);
      setIsPlaying(true);
    }
    update();
  }

  void playPause(Song song) {
    player.playerStateStream.listen((state) {});
  }

  void playerSequence() {}

  Future<void> disposePlayer() async {
    try {
      await player.dispose();
      update();
    } catch (e) {
      print(e);
    }
    setIsPlaying(false);
  }

  void setIsPlaying(bool val) {
    isPlaying = val;
  }

  Future<void> play() async {
    setIsPlaying(true);
    player.play();
  }

  Future<void> pause() async {
    setIsPlaying(false);
    player.pause();
    update();
  }
}
