import "package:dart_plex_api/dart_plex_api.dart";

class PlexPicture implements PlexMediaType {
  static const int id = 12;
  static const String typeString = "picture";
  static const String title = "Picture";
  static const String element = "photo";
  static const List<int> related = [11];
}
