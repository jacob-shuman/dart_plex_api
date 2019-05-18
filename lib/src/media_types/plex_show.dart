import "package:dart_plex_api/dart_plex_api.dart";

class PlexShow implements PlexMediaType {
  int id = 2;
  String typeString = "show";
  String title = "Show";
  String element = "directory";
  List<int> related = [3, 4];
}
