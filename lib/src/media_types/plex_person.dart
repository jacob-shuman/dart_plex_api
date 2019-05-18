import "package:dart_plex_api/dart_plex_api.dart";

class PlexPerson implements PlexMediaType {
  int id = 7;
  String typeString = "person";
  String title = "Person";
  String element = "directory";
  List<int> related = [];
}
