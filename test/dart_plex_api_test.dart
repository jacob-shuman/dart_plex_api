import 'package:dart_plex_api/dart_plex_api.dart';
import 'package:test/test.dart';

void main() {
  group("All Tests -> ", () {
    String _username = "";
    String _password = "";

    PlexCredentials _credentials;
    PlexHeaders _headers;
    PlexConnection _connection;

    setUp(() async {
      _credentials = PlexCredentials(
        username: _username,
        password: _password,
      );

      _headers = PlexHeaders(
        clientIdentifier: "Plex Api Dart Wrapper",
      );

      _headers.setCredentials(_credentials);

      _connection = PlexConnection(
        host: "127.0.0.1",
        port: 32400,
        credentials: _credentials,
        headers: _headers,
      );

      await _connection.authorize();
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

    group("Examples -> ", () {
      test("Example 1", () async {
        PlexCredentials credentials = PlexCredentials(
          username: _username,
          password: _password,
        );

        PlexHeaders headers = PlexHeaders(
          clientIdentifier: "Plex Dart Client",
        );

        PlexConnection connection = await PlexConnection(
          host: "127.0.0.1",
          port: 32400,
          credentials: credentials,
          headers: headers,
        ).authorize();

        // Returns an http [Response] object
        await connection.requestRaw("/");
      });
    });

    group("Routes -> ", () {
      group("Root -> ", () {
        test("Get Root", () async {
          PlexRoot root = await _connection.root.request();

          expect(root, isNotNull);
        });

        test('Get Raw Root', () async {
          dynamic root = await _connection.requestRaw("/");

          expect(root, isNotNull);
        });
      });

      group("Library -> ", () {
        test("Get Library", () async {
          PlexLibrary library = await _connection.root.library.request();

          expect(library, isNotNull);
        });

        test("Get Library Section Index", () async {
          PlexLibrarySectionIndex sections =
              await _connection.root.library.sections.request();

          expect(sections, isNotNull);
        });

        test("Get All Library Sections", () async {
          List<PlexObject> sections =
              await _connection.root.library.sections.all.request();

          expect(sections, isNotNull);
        });

        test("Get Artist Library Section", () async {
          PlexLibrarySectionIndex sections =
              await _connection.root.library.sections.request();

          PlexLibrarySection section = sections.directory.singleWhere(
              (PlexLibrarySection section) =>
                  section.type == PlexArtist.typeString,
              orElse: () => fail("Unable to find an artist section"));

          PlexArtistSection artistSection =
              await _connection.root.library.sections
                  .get(
                    key: section.key,
                    typeString: PlexArtist.typeString,
                  )
                  .request();

          expect(artistSection, isNotNull);
        });
      });

      group("Servers -> ", () {
        test("Get Servers", () async {
          List<PlexServer> servers = await _connection.root.servers.request();

          expect(servers, isNotNull);
        });
      });

      group("Clients -> ", () {
        test("Get Clients", () async {
          List<PlexClient> clients = await _connection.root.clients.request();

          expect(clients, isNotNull);
        });
      });
    });
  });
}
