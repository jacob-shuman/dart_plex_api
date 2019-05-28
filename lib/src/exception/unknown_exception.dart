class UnknownPlexException implements Exception {
  final String msg;
  const UnknownPlexException(this.msg);

  String toString() => msg;
}
