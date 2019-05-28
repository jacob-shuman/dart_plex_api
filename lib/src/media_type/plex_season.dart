import "package:dart_plex_api/dart_plex_api.dart";

class PlexSeason implements PlexMediaType {
  static const int id = 3;
  static const String typeString = "season";
  static const String title = "Season";
  static const String element = "directory";
  static const List<int> related = [2, 4];
}
