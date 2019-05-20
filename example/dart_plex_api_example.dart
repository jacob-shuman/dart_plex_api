import 'package:dart_plex_api/dart_plex_api.dart';

main() async {
  PlexCredentials credentials = PlexCredentials(
    username: "<USERNAME>",
    password: "<PASSWORD>",
  );

  PlexHeaders headers = PlexHeaders(
    clientIdentifier: "Plex Dart Client",
  );

  PlexClient client = await PlexClient(
    host: "127.0.0.1",
    port: 32400,
    credentials: credentials,
    headers: headers,
  ).authorize();

  // Returns an http [Response] object
  await client.rawRequest("/");
}
