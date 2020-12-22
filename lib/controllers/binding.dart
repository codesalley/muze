import 'package:get/instance_manager.dart';
import 'package:muze/controllers/allSongsController.dart';
import 'package:muze/controllers/songPlayerController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AllSongs>(AllSongs());
    Get.put<SongPlayerController>(SongPlayerController());
  }
}
