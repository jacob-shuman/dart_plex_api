import "package:dart_plex_api/dart_plex_api.dart";

class PlexEpisode implements PlexMediaType {
  int id = 4;
  String typeString = "episode";
  String title = "Episode";
  String element = "video";
  List<int> related = [2, 3];
}
