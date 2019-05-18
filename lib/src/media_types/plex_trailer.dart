import "package:dart_plex_api/dart_plex_api.dart";

class PlexTrailer implements PlexMediaType {
  int id = 5;
  String typeString = "trailer";
  String title = "Trailer";
  String element = "video";
  List<int> related = [];
}
