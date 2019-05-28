import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexLibraryRoute extends PlexRoute {
  PlexLibraryRoute({
    @required PlexConnection connection,
    String previousPath,
  }) : super(
          connection: connection,
          path: PlexLibrary.route,
          previousPath: previousPath,
        );

  PlexLibrarySectionIndexRoute get sections => PlexLibrarySectionIndexRoute(
        connection: this.connection,
        previousPath: this.route,
      );

  @override
  Future<PlexLibrary> request() async => PlexLibrary.fromJson(
        connection: this.connection,
        json: (await this.connection.requestJson(this.route))["MediaContainer"],
      );
}
