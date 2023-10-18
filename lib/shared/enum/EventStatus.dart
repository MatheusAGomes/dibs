enum EventStatusEnum {
  PUBLISHED,
  CREATED,
  FINISHED;

  String toEnumString() {
    return toString().split(".").last;
  }
}
