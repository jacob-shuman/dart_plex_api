import "package:dart_plex_api/dart_plex_api.dart";

class PlexShow implements PlexMediaType {
  static const int id = 2;
  static const String typeString = "show";
  static const String title = "Show";
  static const String element = "directory";
  static const List<int> related = [3, 4];
}
