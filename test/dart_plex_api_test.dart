import 'package:dart_plex_api/dart_plex_api.dart';
import 'package:test/test.dart';

void main() {
  group("All Tests", () {
    String _username = "";
    String _password = "";

    PlexCredentials _credentials;
    PlexHeaders _headers;
    PlexClient _client;

    setUp(() async {
      _credentials = PlexCredentials(
        username: _username,
        password: _password,
      );

      _headers = PlexHeaders(
        clientIdentifier: "Plex Api Dart Wrapper",
      );

      _headers.setCredentials(_credentials);

      _client = PlexClient(
        host: "192.168.0.17",
        credentials: _credentials,
        headers: _headers,
      );

      await _client.authorize();
    });

    test('Basic Authorization', () async {
      PlexAuthorization auth = PlexAuthorization(
        credentials: _credentials,
        headers: _headers,
      );

      try {
        await auth.authorize();
      } catch (err) {
        fail(err);
      }

      expect(auth.authorized, isTrue);
    });

    test('Get Raw Root', () async {
      dynamic response = await _client.getRawRoot();

      expect(response, isNotNull);
    });

    test('Get Raw Sessions', () async {
      dynamic response = await _client.getRawSessions();

      expect(response, isNotNull);
    });

    test('Get Raw Library', () async {
      dynamic response = await _client.getRawLibrary();

      expect(response, isNotNull);
    });

    test('Get Raw Library Sections', () async {
      dynamic response = await _client.getRawLibrarySections();

      expect(response, isNotNull);
    });
  });
}
