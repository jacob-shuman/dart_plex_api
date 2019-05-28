import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexClientsRoute extends PlexRoute {
  PlexClientsRoute({
    @required PlexConnection connection,
    String previousPath,
  })  : assert(connection != null),
        super(
          connection: connection,
          path: PlexLibrary.route,
          previousPath: previousPath,
        );

  @override
  Future<List<PlexClient>> request() async =>
      ((await connection.requestJson(PlexClient.path))["MediaContainer"]
              ["Server"] as List<dynamic>)
          .map((dynamic rawServer) => PlexClient.fromJson(
                connection: connection,
                json: rawServer,
              ))
          .toList();
}
