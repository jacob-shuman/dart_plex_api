import "package:dart_plex_api/dart_plex_api.dart";

class PlexEpisode implements PlexMediaType {
  static const int id = 4;
  static const String typeString = "episode";
  static const String title = "Episode";
  static const String element = "video";
  static const List<int> related = [2, 3];
}
