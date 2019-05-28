import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexLibrarySectionIndexRoute extends PlexRoute {
  PlexLibrarySectionIndexRoute({
    @required PlexConnection connection,
    String previousPath,
  }) : super(
          connection: connection,
          path: PlexLibrarySectionIndex.path,
          previousPath: previousPath,
        );

  PlexLibrarySectionRoute get({
    @required String key,
    @required String typeString,
  }) =>
      PlexLibrarySectionRoute(
        connection: connection,
        key: key,
        typeString: typeString,
        previousPath: this.route,
      );

  PlexAllLibrarySectionsRoute get all => PlexAllLibrarySectionsRoute(
        connection: connection,
        indexRoute: this,
        previousPath: this.route,
      );

  @override
  Future<PlexLibrarySectionIndex> request() async =>
      PlexLibrarySectionIndex.fromJson(
        connection: this.connection,
        json: (await this.connection.requestJson(this.route))["MediaContainer"],
      );
}
