import "package:dart_plex_api/dart_plex_api.dart";

class PlexPhoto implements PlexMediaType {
  int id = 13;
  String typeString = "photo";
  String title = "Photo";
  String element = "photo";
  List<int> related = [11];
}
