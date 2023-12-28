extension ListExt on List? {
  bool isNullOrEmpty() {
    if (this == null || this!.isEmpty) return true;

    return false;
  }
}