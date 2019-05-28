import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexLocation extends PlexObject {
  final int id;
  final String path;

  PlexLocation({
    @required PlexConnection connection,
    this.id,
    this.path,
  }) : super(
          connection: connection,
        );

  @override
  PlexLocation.fromJson({
    @required PlexConnection connection,
    @required dynamic json,
  })  : assert(json != null),
        id = json["id"],
        path = json["path"],
        super(
          connection: connection,
        );

  @override
  Map<String, dynamic> toJson() => {
        "id": this.id,
        "path": this.path,
      };
}
