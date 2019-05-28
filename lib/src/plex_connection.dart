import "dart:convert";

import "package:meta/meta.dart";
import "package:http/http.dart" as http;
import "package:dart_plex_api/dart_plex_api.dart";

class PlexConnection {
  PlexAuthorization _auth;

  String host;
  int port;
  PlexCredentials credentials;
  PlexHeaders headers;

  // TODO: Hash Password
  PlexConnection({
    @required this.host,
    @required this.port,
    @required this.credentials,
    this.headers,
  })  : assert(host != null),
        assert(port != null),
        assert(credentials != null) {
    if (this.headers == null) {
      this.headers = PlexHeaders.fromCredentials(
        clientIdentifier: "",
        credentials: this.credentials,
      );
    } else {
      this.headers.setCredentials(this.credentials);
    }

    this._auth = PlexAuthorization(
      credentials: credentials,
      headers: headers,
    );
  }

  Future<PlexConnection> authorize() async {
    dynamic user = await this._auth.authorize();

    this.headers.token = user["authToken"] ?? user["authentication_token"];

    return this;
  }

  bool get authorized => this._auth.authorized && this.headers.token != null;

  Uri get requestUri => Uri(
        scheme: "http",
        host: this.host,
        port: this.port,
      );

  Future<dynamic> requestJson(String route) async =>
      json.decode((await http.get(
        requestUri.replace(path: route),
        headers: this.headers.toMap(),
      ))
          .body);

  Future<http.Response> requestRaw(String route) async => await http.get(
        requestUri.replace(path: route),
        headers: this.headers.toMap(),
      );

  PlexRootRoute get root => PlexRootRoute(
        connection: this,
      );
}
