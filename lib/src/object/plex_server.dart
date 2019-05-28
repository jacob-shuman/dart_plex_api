import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexServer extends PlexObject {
  static final String path = "servers";

  final String name;
  final String host;
  final String address;
  final int port;
  final String machineIdentifier;
  final String version;

  PlexServer({
    @required PlexConnection connection,
    this.name,
    this.host,
    this.address,
    this.port,
    this.machineIdentifier,
    this.version,
  }) : super(
          connection: connection,
        );

  @override
  PlexServer.fromJson({
    @required PlexConnection connection,
    @required dynamic json,
  })  : assert(json != null),
        this.name = json["name"],
        this.host = json["host"],
        this.address = json["address"],
        this.port = json["port"],
        this.machineIdentifier = json["machineIdentifier"],
        this.version = json["version"],
        super(
          connection: connection,
        );

  @override
  Map<String, dynamic> toJson() => {
        "name": this.name,
        "host": this.host,
        "address": this.address,
        "port": this.port,
        "machineIdentifier": this.machineIdentifier,
        "version": this.version,
      };
}
