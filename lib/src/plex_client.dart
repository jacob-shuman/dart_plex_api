import "dart:convert";
import "package:meta/meta.dart";
import "package:http/http.dart" as http;
import "package:dart_plex_api/dart_plex_api.dart";

class PlexClient {
  PlexAuthorization _auth;

  String host;
  PlexCredentials credentials;
  PlexHeaders headers;

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

  void authorize() async {
    dynamic user = await this._auth.authorize();

    this.headers.token = user["authToken"] ?? user["authentication_token"];
  }

  bool get authorized => this._auth.authorized && this.headers.token != null;

  Future<dynamic> getLibrary() async => json.decode(
      ((await rawRequest("/library")).body as dynamic))["MediaContainer"];

  Future<dynamic> getLibrarySections() async =>
      json.decode(((await rawRequest("/library/sections")).body as dynamic))[
          "MediaContainer"];

  Future<http.Response> rawRequest(String route) async => await http.get(
        Uri(
          scheme: "http",
          host: this.host,
          path: route,
          port: 32400,
        ),
        headers: this.headers.toMap(),
      );
}
