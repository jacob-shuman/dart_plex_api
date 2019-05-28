import "package:dart_plex_api/dart_plex_api.dart";

abstract class PlexMediaType {
  // int id;
  // String typeString;
  // String title;
  // String element;
  // List<int> related;

  // static const movie = PlexMovie();

  // static PlexMediaType get movie => PlexMovie();
  // static PlexMediaType get show => PlexShow();
  // static PlexMediaType get season => PlexSeason();
  // static PlexMediaType get episode => PlexEpisode();
  // static PlexMediaType get trailer => PlexTrailer();
  // static PlexMediaType get comic => PlexComic();
  // static PlexMediaType get person => PlexPerson();
  // static PlexMediaType get artist => PlexArtist();
  // static PlexMediaType get album => PlexAlbum();
  // static PlexMediaType get track => PlexTrack();
  // static PlexMediaType get photoAlbum => PlexPhotoAlbum();
  // static PlexMediaType get picture => PlexPicture();
  // static PlexMediaType get photo => PlexPhoto();
  // static PlexMediaType get clip => PlexClip();
  // static PlexMediaType get playlistItem => PlexPlaylistItem();

  static PlexMediaType fromTypeString(String type) {
    switch (type) {
      case "movie":
        return PlexMovie();
      case "show":
        return PlexShow();
      case "season":
        return PlexSeason();
      case "episode":
        return PlexEpisode();
      case "trailer":
        return PlexTrailer();
      case "comic":
        return PlexComic();
      case "person":
        return PlexPerson();
      case "artist":
        return PlexArtist();
      case "album":
        return PlexAlbum();
      case "track":
        return PlexTrack();
      case "photoAlbum":
        return PlexPhotoAlbum();
      case "picture":
        return PlexPicture();
      case "photo":
        return PlexPhoto();
      case "clip":
        return PlexClip();
      case "playlistItem":
        return PlexPlaylistItem();
      default:
        throw UnknownMediaTypeException(
            "Cannot construct PlexMediaType from unknown type string!");
    }
  }
}
