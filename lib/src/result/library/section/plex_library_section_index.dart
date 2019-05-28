import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexLibrarySectionIndex extends PlexObject {
  static final path = "sections";

  final bool allowSync;
  final String identifier;
  final String mediaTagPrefix;
  final int mediaTagVersion;
  final String title1;
  final List<PlexLibrarySection> directory;

  PlexLibrarySectionIndex({
    @required PlexConnection connection,
    this.allowSync,
    this.identifier,
    this.mediaTagPrefix,
    this.mediaTagVersion,
    this.title1,
    this.directory,
  }) : super(
          connection: connection,
        );

  @override
  PlexLibrarySectionIndex.fromJson({
    @required PlexConnection connection,
    @required dynamic json,
  })  : assert(json != null),
        allowSync = json["allowSync"],
        identifier = json["identifier"],
        mediaTagPrefix = json["mediaTagPrefix"],
        mediaTagVersion = json["mediaTagVersion"],
        title1 = json["title1"],
        directory = json["Directory"] != null
            ? List.generate(
                (json["Directory"] as List<dynamic>).length,
                (int index) => PlexLibrarySection.fromJson(
                      connection: connection,
                      json: json["Directory"][index],
                    ),
              )
            : null,
        super(
          connection: connection,
        );

  @override
  Map<String, dynamic> toJson() => {
        "allowSync": this.allowSync,
        "identifier": this.identifier,
        "mediaTagPrefix": this.mediaTagPrefix,
        "mediaTagVersion": this.mediaTagVersion,
        "title1": this.title1,
        "directory": this.directory,
      };
}
