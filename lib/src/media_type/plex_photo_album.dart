import "package:dart_plex_api/dart_plex_api.dart";

class PlexPhotoAlbum implements PlexMediaType {
  static const int id = 11;
  static const String typeString = "photoAlbum";
  static const String title = "Photo Album";
  static const String element = "directory";
  static const List<int> related = [12, 13];
}
