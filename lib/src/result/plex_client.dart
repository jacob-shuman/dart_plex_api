import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexClient extends PlexObject {
  static final String path = "clients";

  final String name;
  final String host;
  final String address;
  final int port;
  final String machineIdentifier;
  final String version;
  final String protocol;
  final String product;
  final String deviceClass;
  final String protocolVersion;
  final String protocolCapabilities;

  PlexClient({
    @required PlexConnection connection,
    this.name,
    this.host,
    this.address,
    this.port,
    this.machineIdentifier,
    this.version,
    this.protocol,
    this.product,
    this.deviceClass,
    this.protocolVersion,
    this.protocolCapabilities,
  }) : super(
          connection: connection,
        );

  @override
  PlexClient.fromJson({
    @required PlexConnection connection,
    @required dynamic json,
  })  : assert(json != null),
        this.name = json["name"],
        this.host = json["host"],
        this.address = json["address"],
        this.port = json["port"],
        this.machineIdentifier = json["machineIdentifier"],
        this.version = json["version"],
        this.protocol = json["protocol"],
        this.product = json["product"],
        this.deviceClass = json["deviceClass"],
        this.protocolVersion = json["protocolVersion"],
        this.protocolCapabilities = json["protocolCapabilities"],
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
        "protocol": this.protocol,
        "product": this.product,
        "deviceClass": this.deviceClass,
        "protocolVersion": this.protocolVersion,
        "protocolCapabilities": this.protocolCapabilities,
      };
}
