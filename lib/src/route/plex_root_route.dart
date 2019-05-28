import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexRootRoute extends PlexRoute {
  PlexRootRoute({
    @required PlexConnection connection,
  })  : assert(connection != null),
        super(
          connection: connection,
          path: PlexRoot.path,
        );

  PlexLibraryRoute get library => PlexLibraryRoute(
        connection: this.connection,
        previousPath: this.route,
      );

  PlexServersRoute get servers => PlexServersRoute(
        connection: this.connection,
        previousPath: this.route,
      );

  PlexClientsRoute get clients => PlexClientsRoute(
        connection: this.connection,
        previousPath: this.route,
      );

  @override
  Future<PlexRoot> request() async => PlexRoot.fromJson(
        connection: this.connection,
        json: (await this.connection.requestJson(this.route))["MediaContainer"],
      );
}
