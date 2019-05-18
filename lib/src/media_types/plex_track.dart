import "package:dart_plex_api/dart_plex_api.dart";

class PlexTrack implements PlexMediaType {
  int id = 10;
  String typeString = "track";
  String title = "Track";
  String element = "audio";
  List<int> related = [8, 9];
}
