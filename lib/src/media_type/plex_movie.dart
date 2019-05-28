import "package:dart_plex_api/dart_plex_api.dart";

class PlexMovie implements PlexMediaType {
  static const int id = 1;
  static const String typeString = "movie";
  static const String title = "Movie";
  static const String element = "video";
  static const List<int> related = [];
}
