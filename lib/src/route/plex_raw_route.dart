import 'package:dart_plex_api/src/result/plex_raw_result.dart';
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
  Future<PlexRawResult> request() async => PlexRawResult.fromJson(
        connection: this.connection,
        json: (await this.connection.requestJson(route))["MediaContainer"],
      );
}
