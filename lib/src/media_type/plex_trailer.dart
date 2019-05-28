import "package:dart_plex_api/dart_plex_api.dart";

class PlexTrailer implements PlexMediaType {
  static const int id = 5;
  static const String typeString = "trailer";
  static const String title = "Trailer";
  static const String element = "video";
  static const List<int> related = [];
}
