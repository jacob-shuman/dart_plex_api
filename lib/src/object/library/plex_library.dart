import "package:meta/meta.dart";
import "package:dart_plex_api/dart_plex_api.dart";

class PlexLibrary extends PlexObject {
  static final String route = "library";

  final bool allowSync;
  final String art;
  final String content;
  final String identifier;
  final String mediaTagPrefix;
  final int mediaTagVersion;
  final String title1;
  final String title2;
  final List<PlexDirectory> directory;

  PlexLibrary({
    @required PlexConnection connection,
    this.allowSync,
    this.art,
    this.content,
    this.identifier,
    this.mediaTagPrefix,
    this.mediaTagVersion,
    this.title1,
    this.title2,
    this.directory,
  }) : super(
          connection: connection,
        );

  @override
  PlexLibrary.fromJson({
    @required PlexConnection connection,
    @required dynamic json,
  })  : assert(json != null),
        allowSync = json["allowSync"],
        art = json["art"],
        content = json["content"],
        identifier = json["identifier"],
        mediaTagPrefix = json["mediaTagPrefix"],
        mediaTagVersion = json["mediaTagVersion"],
        title1 = json["title1"],
        title2 = json["title2"],
        directory = json["Directory"] != null
            ? List.generate(
                (json["Directory"] as List<dynamic>).length,
                (int index) => PlexDirectory.fromJson(
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
        "art": this.art,
        "content": this.content,
        "identifier": this.identifier,
        "mediaTagPrefix": this.mediaTagPrefix,
        "mediaTagVersion": this.mediaTagVersion,
        "title1": this.title1,
        "title2": this.title2,
        "directory": this.directory,
      };
}
