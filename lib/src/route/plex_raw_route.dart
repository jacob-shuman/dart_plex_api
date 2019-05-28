import "package:meta/meta.dart";
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexRawRoute extends PlexRoute {
  PlexRawRoute({
    @required PlexConnection connection,
    String path,
    String previousPath,
  })  : assert(connection != null),
        super(
          connection: connection,
          path: path,
          previousPath: previousPath,
        );

  @override
  Future<PlexRawObject> request() async => PlexRawObject.fromJson(
        connection: this.connection,
        json: (await this.connection.requestJson(route))["MediaContainer"],
      );
}
