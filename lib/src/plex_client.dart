import "dart:convert";
import "package:meta/meta.dart";
import "package:http/http.dart" as http;
import "package:dart_plex_api/dart_plex_api.dart";

class PlexClient {
  PlexAuthorization _auth;

  String host;
  PlexCredentials credentials;
  PlexHeaders headers;

  // TODO: Hash Password
  PlexClient({
    @required this.host,
    @required this.credentials,
    this.headers,
  })  : assert(host != null),
        assert(credentials != null) {
    if (this.headers == null) {
      this.headers = PlexHeaders.fromCredentials(credentials: this.credentials);
    } else {
      this.headers.setCredentials(this.credentials);
    }

    this._auth = PlexAuthorization(
      credentials: credentials,
      headers: headers,
    );
  }

  Future<void> authorize() async {
    dynamic user = await this._auth.authorize();

    this.headers.token = user["authToken"] ?? user["authentication_token"];
  }

  bool get authorized => this._auth.authorized && this.headers.token != null;

  Future<dynamic> getRawRoot() async =>
      json.decode(((await rawRequest("/")).body as dynamic))["MediaContainer"];

  Future<dynamic> getRawSessions() async =>
      json.decode(((await rawRequest("/status/sessions")).body as dynamic))[
          "MediaContainer"];

  Future<dynamic> getRawLibrary() async => json.decode(
      ((await rawRequest("/library")).body as dynamic))["MediaContainer"];

  Future<dynamic> getRawLibrarySections() async =>
      json.decode(((await rawRequest("/library/sections")).body as dynamic))[
          "MediaContainer"];

  Uri get requestUri => Uri(
        scheme: "http",
        host: this.host,
        port: 32400,
      );

  Future<http.Response> rawRequest(String route) async => await http.get(
        requestUri.replace(path: route),
        headers: this.headers.toMap(),
      );
}
