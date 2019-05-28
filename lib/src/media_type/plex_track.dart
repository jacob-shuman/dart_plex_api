import "package:dart_plex_api/dart_plex_api.dart";

class PlexTrack implements PlexMediaType {
  static const int id = 10;
  static const String typeString = "track";
  static const String title = "Track";
  static const String element = "audio";
  static const List<int> related = [8, 9];
}
