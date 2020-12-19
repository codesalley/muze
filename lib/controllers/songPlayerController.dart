import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muze/controllers/allSongs.dart';
import 'package:muze/modules/song.dart';
import 'package:get/get.dart';

class SongPlayerController extends GetxController {
  AudioPlayer audioplayer;
  bool isPlaying = false.obs();
  var currentSong;
  int currentSongIndex = 0.obs();
  List allSongs;

  void musicStart(var song) {
    if (song != null) {
      currentSong = song.obs();
      currentSongIndex =
          allSongs.indexWhere((element) => element.path == currentSong.path);
      audioplayer = AudioPlayer();
      audioplayer.setFilePath(currentSong.path);
      play();
      update();
    }
  }

  void songPlayPauseRegulator(var song) async {
    if (currentSong.path == null) {
      await musicStart(song);
      setIsPlaying(true);
    } else if (currentSong.path == song.path) {
      isPlaying ? pause() : play();
    } else if (currentSong.path != song.path) {
      audioplayer.dispose();
      await musicStart(song);
      setIsPlaying(true);
    }
  }

  void setIsPlaying(bool val) {
    isPlaying = val;
    update();
  }

  Future<void> play() async {
    setIsPlaying(true);
    audioplayer.play();
  }

  Future<void> pause() async {
    setIsPlaying(false);
    audioplayer.pause();
  }

  static SongPlayerController get to => Get.find<SongPlayerController>();
}
