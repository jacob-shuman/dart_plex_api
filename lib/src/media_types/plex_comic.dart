import "package:dart_plex_api/dart_plex_api.dart";

class PlexComic implements PlexMediaType {
  int id = 6;
  String typeString = "comic";
  String title = "Comic";
  String element = "photo";
  List<int> related = [];
}
