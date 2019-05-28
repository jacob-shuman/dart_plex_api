class MissingHeadersPlexException implements Exception {
  final String msg;
  const MissingHeadersPlexException(this.msg);

  String toString() => msg;
}
