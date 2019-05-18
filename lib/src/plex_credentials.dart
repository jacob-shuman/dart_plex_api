import 'dart:convert';
import "package:meta/meta.dart";

class PlexCredentials {
  String _username;
  String _password;

  PlexCredentials({
    @required username,
    @required password,
  })  : assert(username != null && username != null),
        assert(password != null && password != null) {
    this._username = username;
    this._password = password;
  }

  /// Returns [str] encoded in base64
  String _encode(String str) => base64.encode(utf8.encode(str));

  String get basicAuthHeader => "Basic " + _encode("${_username}:${_password}");
}
