import "package:dart_plex_api/dart_plex_api.dart";

class PlexPhoto implements PlexMediaType {
  static const int id = 13;
  static const String typeString = "photo";
  static const String title = "Photo";
  static const String element = "photo";
  static const List<int> related = [11];
}
