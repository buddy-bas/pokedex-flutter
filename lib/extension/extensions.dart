extension CapitalizeExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension GetIdFormUrlExtension on String {
  String idFromPokeUrl() {
    final uri = Uri.parse(this);
    final id = uri.pathSegments[3];
    return id;
  }
}
