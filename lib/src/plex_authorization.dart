import "dart:convert";

import "package:meta/meta.dart";
import "package:http/http.dart" as http;
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexAuthorization {
  Uri _authEndpoint = Uri.https("plex.tv", "/users/sign_in.json");
  PlexCredentials credentials;
  PlexHeaders headers;

  dynamic _user;

  PlexAuthorization({
    @required this.credentials,
    @required this.headers,
  })  : assert(credentials != null),
        assert(headers != null) {
    this.headers.setCredentials(this.credentials);
  }

  Future<dynamic> authorize() async {
    http.Response response = await http.post(
      _authEndpoint,
      headers: this.headers.toMap(),
    );

    dynamic result = json.decode(response.body);

    var error = result["error"];

    if (error != null) {
      throw getException(error);
    }

    _user = result["user"];

    return _user;
  }

  bool get authorized => _user != null;

  Exception getException(String msg) {
    switch (msg) {
      case "Invalid email, username, or password.":
        return InvalidCredentialsPlexException(msg);
      case "You appear to be having trouble signing in to an account. You may wish to try resetting your password at https://plex.tv/reset":
        return InvalidCredentialsPlexException(msg);
      case "Plex client headers are required":
        return MissingHeadersPlexException(msg);
      default:
        return UnknownPlexException(msg);
    }
  }
}
