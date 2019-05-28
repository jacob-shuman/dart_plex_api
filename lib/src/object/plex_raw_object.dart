import "package:meta/meta.dart";
import 'package:dart_plex_api/dart_plex_api.dart';

class PlexRawObject extends PlexObject {
  final dynamic props;

  PlexRawObject({
    @required PlexConnection connection,
    this.props,
  }) : super(
          connection: connection,
        );

  @override
  PlexRawObject.fromJson({
    @required PlexConnection connection,
    @required dynamic json,
  })  : assert(json != null),
        props = json,
        super(
          connection: connection,
        );

  // TODO: manually add each property to dynamic result
  @override
  Map<String, dynamic> toJson() => {
        "props": this.props,
      };
}
