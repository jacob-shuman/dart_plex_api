import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

/// Marker class
abstract class PlexObject {
  /// This connection can be used for further queries.
  final PlexConnection connection;

  PlexObject({
    @required this.connection,
  }) : assert(connection != null);

  PlexObject.fromJson({
    @required this.connection,
    @required dynamic json,
  })  : assert(connection != null),
        assert(json != null);

  Map<String, dynamic> toJson();

  @override
  String toString() => this.toJson().toString();
}
