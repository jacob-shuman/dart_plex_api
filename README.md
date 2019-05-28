[![pub package](https://img.shields.io/pub/v/dart_plex_api.svg)](https://pub.dartlang.org/packages/dart_plex_api)

_An API wrapper for the Plex Web API._

The Plex Web API is a poorly documented api exposed by [Plex](https://www.plex.tv) servers.

## Import Package

```dart
import 'package:dart_plex_api/dart_plex_api.dart';
```

## Getting Started (Setup Connection)

1. Create a `PlexCredentials` object representing your plex account

```dart
PlexCredentials credentials = PlexCredentials(
    username: "<USERNAME>",
    password: "<PASSWORD>",
  );
```

2. Create a `PlexHeaders` object with, at least, an identifier for your client.

```dart
PlexHeaders headers = PlexHeaders(
    clientIdentifier: "Plex Dart Client",
  );
```

3. Finally, create a `PlexConnection` object passing the previous 2 objects. Be sure to call the asynchronous `authorize` method to ensure a safe connection.

```dart
PlexConnection connection = await PlexConnection(
    host: "127.0.0.1",
    port: 32400,
    credentials: credentials,
    headers: headers,
  ).authorize();
```

## Requests

**dart_plex_api** supports manual raw requests and known routes (using PlexRoutes).

### Raw

```dart
http.Response response = await connection.requestRaw("/");
```

## Routing

Since the API is not properly documented, it may be difficult to know the exact result structure and correct route formats. `PlexRoute` objects provide a way to quickly query routes without immediate knowledge of raw routes. Each `PlexRoute` has a `request` which returns a `PlexObject`.

```dart
PlexRoot root = await connection.root.request();
```

This is also useful when multiple requests are neccessary to retrieve data. For example, it would be wise to query all library sections (at `"/library/sections"`) to get a listing of library sections, followed by a request to get more details (at `"/library/sections/<SECTION_KEY>"`).

```dart
dynamic sections = json.decode(
  (await connection.requestRaw("/library/sections")).body
)["MediaContainer"]["Directory"][0];

dynamic firstSection = json.decode(
  (await connection.requestRaw("/library/sections/" + sections["key"])).body
);
```

This can be done much easier using routing objects.

```dart
PlexLibrarySectionIndex index = await connection.root.library.sections.all.request();

/// A String identifying the Library Section
String key = index.directory[0].key;

/// A String identifying the type of section (ie Music, Photos, Videos...)
String type = index.directory[0].type;

List<PlexObject> sections = await connection.root.library.sections
  .get(
    key: key,
    typeString:type,
  ).request();
```

## Usage

### Root

#### Raw

```dart
http.Response response = await connection.requestRaw("/");
```

#### Routing

```dart
PlexRoot root = await connection.root.request();
```

### Library

#### Raw

```dart
http.Response response = await connection.requestRaw("/library");
```

#### Routing

```dart
PlexLibrary library = await connection.root.library.request();
```

### Library Section

#### Raw

```dart
http.Response response = await connection.requestRaw("/library/sections/2");
```

#### Routing

```dart
PlexObject library = await connection.root.library.sections.get("2")request();
```

## Other Resources

Unofficial Python Bindings for Plex Api: https://github.com/pkkid/python-plexapi

Unofficial API Wiki (Earlopain): https://gitlab.com/Earlopain/plex-webapi

Unofficial API Wiki (Arcanemagus): https://github.com/Arcanemagus/plex-api/wiki

Remote control API Wiki (plexinc): https://github.com/plexinc/plex-media-player/wiki/Remote-control-API
