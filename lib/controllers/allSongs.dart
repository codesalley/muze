import 'dart:ffi';

import 'dart:io';

import 'package:audiotagger/audiotagger.dart';
import 'package:get/get.dart';
import 'package:muze/modules/song.dart';
import 'package:muze/testData/song.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AllSongs extends GetxController {
  List<dynamic> allsongs = [].obs();

  @override
  void onInit() {
    getAllSongs();
    super.onInit();
  }
  // request permission and get list of all folders

  Future<Void> getAllSongs() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      List<Directory> deviceStorage = await getExternalStorageDirectories();
      List<Directory> pathToStorage = [];
      for (var dir in deviceStorage) {
        pathToStorage.add(Directory(dir.path.split("Android")[0]));
        print('Diretories captured');
      }
      List<FileSystemEntity> allFolder = await getAllFolders(pathToStorage);
      await searchFolder(allFolder);
    } else {
      var status = await Permission.storage.request();
    }
  }

  //search every file in folders for files ending with mp3
  Future<void> getAllFiles(String path) async {
    for (FileSystemEntity file in Directory(path).listSync()) {
      if (FileSystemEntity.isFileSync(file.path) &&
          basename(file.path).endsWith('mp3')) {
        allsongs.add(file.path);

        update();
      } else if (FileSystemEntity.isDirectorySync(file.path) &&
          !basename(file.path).endsWith('.') &&
          !file.path.contains('/Android')) {
        getAllFiles(file.path);
      }
    }
  }

  Future<void> searchFolder(List folders) async {
    for (FileSystemEntity file in folders) {
      if (FileSystemEntity.isFileSync(file.path) &&
          basename(file.path).endsWith('mp3')) {
        allsongs.add(file.path);
        update();
      } else if (FileSystemEntity.isDirectorySync(file.path)) {
        await getAllFiles(file.path);
      }
    }
  }

  // getting folder list

  Future<List<FileSystemEntity>> getAllFolders(List path) async {
    List<FileSystemEntity> allFolders = [];
    for (var dir in path) {
      allFolders.addAll([...dir.listSync()]);
      update();
    }
    return allFolders;
  }

//gets song destails using audio tagger
  Future<void> getsongdetails(String file) async {
    var audiotagger = Audiotagger();

    var audioInfo;
    try {
      audioInfo = await audiotagger.readTags(path: file);
    } catch (e) {
      print(e.toString());
    }
    return Song.fromMap(audioInfo, filePath: file);
  }

  static AllSongs get to => Get.find<AllSongs>();
}
