/// Class for operations with numbers
abstract final class ConfigNumbers {
  static String shortValue(int? value) {
    return switch (value) {
      null => "0",
      < 1000 => value.toString(),
      >= 1000 && < 1000000 => value.toString(),
      >= 1000 && < 1000000 => "${(value / 1000).toStringAsFixed(1)} k",
      >= 1000000 && < 1000000000 => "${(value / 1000000).toStringAsFixed(1)} M",
      >= 1000000000 => "${(value / 1000000000).toStringAsFixed(1)} G",
      _ => "0",
    };
  }
}
