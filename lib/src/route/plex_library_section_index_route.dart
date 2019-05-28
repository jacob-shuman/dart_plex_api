import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexLibrarySectionIndexRoute extends PlexRoute {
  PlexLibrarySectionIndexRoute({
    @required PlexConnection connection,
    String previousPath,
  }) : super(
          connection: connection,
          path: PlexLibrarySectionIndex.path,
          previousPath: previousPath,
        );

  // @override
  // Future<PlexLibrarySectionIndex> request() async {
  //   List<PlexLibrarySection> sections = [];

  //   await Future.forEach(
  //       ((await connection
  //                   .requestJson(PlexLibrarySection.route))["MediaContainer"]
  //               ["Directory"] as List<dynamic>)
  //           .map((dynamic rawSection) {
  //         switch (rawSection["type"]) {
  //           // case PlexArtist.typeString:
  //           //   sections.add(PlexArtistSection.fromJson(
  //           //     connection: connection,
  //           //     json: rawSection,
  //           //   ));
  //           //   break;
  //           default:
  //             sections.add(PlexLibrarySection.fromJson(
  //               connection: connection,
  //               json: rawSection,
  //             ));
  //         }
  //       }).toList(),
  //       (dynamic rawSection) async {});

  //   return sections;
  // }

  // Future<PlexLibrarySection>

  PlexLibrarySectionRoute get({
    @required String key,
    @required String typeString,
  }) =>
      PlexLibrarySectionRoute(
        connection: connection,
        key: key,
        typeString: typeString,
        previousPath: this.route,
      );

  @override
  Future<PlexLibrarySectionIndex> request() async =>
      PlexLibrarySectionIndex.fromJson(
        connection: this.connection,
        json: (await this.connection.requestJson(this.route))["MediaContainer"],
      );
}
