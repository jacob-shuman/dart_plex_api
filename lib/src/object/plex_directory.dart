import "package:meta/meta.dart";
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexDirectory extends PlexObject {
  final int count;
  final String prompt;
  final bool secondary;
  final bool search;
  final String key;
  final String title;

  PlexDirectory({
    @required PlexConnection connection,
    this.count,
    this.prompt,
    this.secondary,
    this.search,
    this.key,
    this.title,
  }) : super(
          connection: connection,
        );

  @override
  PlexDirectory.fromJson({
    @required PlexConnection connection,
    @required dynamic json,
  })  : assert(json != null),
        count = json["count"],
        prompt = json["prompt"],
        secondary = json["secondary"],
        search = json["search"],
        key = json["key"],
        title = json["title"],
        super(
          connection: connection,
        );

  @override
  Map<String, dynamic> toJson() => {
        "count": this.count,
        "prompt": this.prompt,
        "secondary": this.secondary,
        "search": this.search,
        "key": this.key,
        "title": this.title,
      };
}
