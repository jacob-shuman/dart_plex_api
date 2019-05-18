class InvalidCredentialsPlexException implements Exception {
  final String msg;
  const InvalidCredentialsPlexException(this.msg);

  String toString() => "Invalid email, username, or password.";
}
