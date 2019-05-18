import "package:dart_plex_api/dart_plex_api.dart";

class PlexPlaylistItem implements PlexMediaType {
  int id = 15;
  String typeString = "playlistItem";
  String title = "Clip";
  String element = "video";
  List<int> related = [];
}
