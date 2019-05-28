import "package:dart_plex_api/dart_plex_api.dart";

class PlexAlbum implements PlexMediaType {
  static const int id = 9;
  static const String typeString = "album";
  static const String title = "Album";
  static const String element = "directory";
  static const List<int> related = const [8, 10];
}
