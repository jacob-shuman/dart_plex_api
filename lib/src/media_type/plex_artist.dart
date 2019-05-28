import "package:dart_plex_api/dart_plex_api.dart";

class PlexArtist implements PlexMediaType {
  static const int id = 8;
  static const String typeString = "artist";
  static const String title = "Artist";
  static const String element = "directory";
  static const List<int> related = [9, 10];
}
