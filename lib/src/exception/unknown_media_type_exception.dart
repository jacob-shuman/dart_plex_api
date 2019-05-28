class UnknownMediaTypeException implements Exception {
  final String msg;
  const UnknownMediaTypeException(this.msg);

  String toString() => msg;
}
