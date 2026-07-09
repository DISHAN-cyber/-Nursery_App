String formatDisplayName(String? name) {
  if (name == null || name.trim().isEmpty) {
    return 'Guest';
  }
  return name.trim();
}
