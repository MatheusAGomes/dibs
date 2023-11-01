enum BatchStatus {
  PUBLISHED,
  CREATED,
  FINISHED;

  String toEnumString() {
    return toString().split(".").last;
  }
}
