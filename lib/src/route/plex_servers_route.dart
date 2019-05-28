import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexServersRoute extends PlexRoute {
  PlexServersRoute({
    @required PlexConnection connection,
    String previousPath,
  })  : assert(connection != null),
        super(
          connection: connection,
          path: PlexLibrary.route,
          previousPath: previousPath,
        );

  @override
  Future<List<PlexServer>> request() async =>
      ((await connection.requestJson(PlexServer.path))["MediaContainer"]
              ["Server"] as List<dynamic>)
          .map((dynamic rawServer) => PlexServer.fromJson(
                connection: connection,
                json: rawServer,
              ))
          .toList();
}
