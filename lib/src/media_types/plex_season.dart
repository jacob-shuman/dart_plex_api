import "package:dart_plex_api/dart_plex_api.dart";

class PlexSeason implements PlexMediaType {
  int id = 3;
  String typeString = "season";
  String title = "Season";
  String element = "directory";
  List<int> related = [2, 4];
}
