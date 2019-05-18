import "package:dart_plex_api/dart_plex_api.dart";

class PlexPhotoAlbum implements PlexMediaType {
  int id = 11;
  String typeString = "photoAlbum";
  String title = "Photo Album";
  String element = "directory";
  List<int> related = [12, 13];
}
