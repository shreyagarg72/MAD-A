// Abstract Media class
abstract class Media {
  String title;
  String artist;

  Media(this.title, this.artist);
}

// Playable interface
abstract class Playable {
  void play();
}

// Logger mixin
mixin Logger {
  void log(String message, {String level = 'info'}) {
    print('[$level] $message');
  }
}

// Song class
class Song extends Media implements Playable, Logger {
  int duration;

  Song(String title, String artist, this.duration) : super(title, artist);

  @override
  void play() {
    log('Playing song "$title" by $artist', level: 'info');
    // Play song implementation
  }

  @override
  void logDebug(String message) {
    log(message, level: 'debug');
  }

  @override
  void logInfo(String message) {
    log(message, level: 'info');
  }

  @override
  void logWarning(String message) {
    log(message, level: 'warning');
  }

  @override
  void logError(String message) {
    log(message, level: 'error');
  }
  
  @override
  void log(String message, {String level = 'info'}) {
    // TODO: implement log
  }
}

// Album class
class Album extends Media implements Playable, Logger {
  List<Song> songs;

  Album(String title, String artist, this.songs) : super(title, artist);

  @override
  void play() {
    log('Playing album "$title" by $artist', level: 'info');
    for (var song in songs) {
      song.play();
    }
  }

  @override
  void logDebug(String message) {
    log(message, level: 'debug');
  }

  @override
  void logInfo(String message) {
    log(message, level: 'info');
  }

  @override
  void logWarning(String message) {
    log(message, level: 'warning');
  }

  @override
  void logError(String message) {
    log(message, level: 'error');
  }
  
  @override
  void log(String message, {String level = 'info'}) {
    // TODO: implement log
  }
}

// Playlist class
class Playlist extends Media implements Playable, Logger {
  List<Media> items;

  Playlist(String title, String artist, this.items) : super(title, artist);

  @override
  void play() {
    log('Playing playlist "$title" by $artist', level: 'info');
    for (var item in items) {
      if (item is Playable) {
        (item as Playable).play();
      } else {
        logWarning('${item.runtimeType} is not playable');
      }
    }
  }

  @override
  void logDebug(String message) {
    log(message, level: 'debug');
  }

  @override
  void logInfo(String message) {
    log(message, level: 'info');
  }

  @override
  void logWarning(String message) {
    log(message, level: 'warning');
  }

  @override
  void logError(String message) {
    log(message, level: 'error');
  }
  
  @override
  void log(String message, {String level = 'info'}) {
    // TODO: implement log
  }
}

void main() {
  // Create instances of media items
  Song song = Song('despacito', 'harris', 354);
  Album album = Album('Greatest Hits', 'harris', [
    Song('despacito', 'harris', 354),
    Song('helloo', 'harris', 208),
    Song('Under Pressure', 'harris & David Bowie', 240),
  ]);
  Playlist playlist = Playlist('Rock Classics', 'Various Artists', [
    song,
    album,
    Song('Sweet Child O\' Mine', 'Guns N\' Roses', 356),
  ]);
  song.play();
  album.play();
  playlist.play();

 
}