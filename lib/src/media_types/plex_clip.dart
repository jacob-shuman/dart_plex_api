import "package:dart_plex_api/dart_plex_api.dart";

class PlexClip implements PlexMediaType {
  int id = 14;
  String typeString = "clip";
  String title = "Clip";
  String element = "video";
  List<int> related = [];
}
