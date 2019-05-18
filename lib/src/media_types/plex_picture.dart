import "package:dart_plex_api/dart_plex_api.dart";

class PlexPicture implements PlexMediaType {
  int id = 12;
  String typeString = "picture";
  String title = "Picture";
  String element = "photo";
  List<int> related = [11];
}
