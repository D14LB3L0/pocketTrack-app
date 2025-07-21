// Numbers

String formatToTwoDecimals(num value) {
  return value.toStringAsFixed(2);
}

// Strings

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
