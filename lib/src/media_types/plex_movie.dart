import "package:dart_plex_api/dart_plex_api.dart";

class PlexMovie implements PlexMediaType {
  int id = 1;
  String typeString = "movie";
  String title = "Movie";
  String element = "video";
  List<int> related = [];
}
