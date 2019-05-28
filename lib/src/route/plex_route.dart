import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

abstract class PlexRoute<T> {
  final PlexConnection connection;
  final String path;
  final String previousPath;

  const PlexRoute({
    @required this.connection,
    @required this.path,
    this.previousPath = "",
  })  : assert(connection != null),
        assert(path != null);

  String get route => "${previousPath ?? "/"}$path/";

  @override
  String toString() => this.route;

  Future<T> request();
}
