import "package:dart_plex_api/dart_plex_api.dart";

class PlexAlbum implements PlexMediaType {
  int id = 9;
  String typeString = "album";
  String title = "Album";
  String element = "directory";
  List<int> related = [8, 10];
}
