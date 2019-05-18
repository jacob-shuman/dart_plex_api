import "package:dart_plex_api/dart_plex_api.dart";

class PlexArtist implements PlexMediaType {
  int id = 8;
  String typeString = "artist";
  String title = "Artist";
  String element = "directory";
  List<int> related = [9, 10];
}
