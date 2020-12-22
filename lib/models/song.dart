import 'dart:io';

class Song {
  String songTitle;
  String artistName;
  String album;
  String genre;
  String path;
  String year;
  DateTime dateAdded;

  Song(
      {this.album, this.artistName, this.songTitle, this.path, this.dateAdded});

  Song.fromMap(Map<dynamic, dynamic> info, {String filePath}) {
    var date;
    try {
      // if coming from db filepath will be null
      date = File(filePath ?? info['path']).lastAccessedSync();
    } catch (err) {
      date = DateTime(2000);
      print(err);
    }
    // if coming from db filepath will be null
    this.path = filePath ?? info['path'];
    this.songTitle =
        info != null && info['title'] != null && info['title'] != ''
            ? info['title']
            : filePath.split('/').last.split('.mp3').first;
    this.artistName =
        info != null && info['artist'] != null && info['artist'] != ''
            ? info['artist']
            : 'Unknown artist';
    this.genre = info != null && info['genre'] != null ? info['genre'] : '';
    this.album = info != null && info['album'] != null ? info['album'] : '';
    this.year = info != null && info['year'] != null ? info['year'] : '';
    this.dateAdded = date;
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'path': this.path,
      'title': this.songTitle,
      'artist': this.artistName,
      'genre': this.genre,
      'album': this.album,
      'year': this.year,
    };
  }
}
