import '../../../database.dart';

class SongFieldMapping {
  static fieldToColumnMap(SharedDatabase db) => {
    // Song table mappings
    'songId': db.song.id,
    'songName': db.song.name,
    'searchText': db.song.name, // Mapping searchText to song name
    'albumId': db.song.albumId,
    'songLocked': db.song.locked,
    'songPublished': db.song.published,

    // Album table mappings (if you want to filter by album attributes too)
    'albumCode': db.album.code,
    'albumName': db.album.name,
  };
}
