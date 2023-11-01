enum EventCategory {
  SHOW,
  TEATRO,
  CORRIDA,
  FESTA,
  RELIGIOSO;

  String toEnumString() {
    return toString().split(".").last;
  }
}
