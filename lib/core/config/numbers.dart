/// Class for operations with numbers
abstract final class ConfigNumbers {
  // Setting abbreviations for large numbers
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

  // Converting time to a suitable format
  static String convertTime(int time) {
    if (time == 0) return '00:00:00 000';

    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String miliseconds(int n) {
      return switch (n) {
        >= 100 => n.toString(),
        >= 10 => n.toString().padLeft(2, '0'),
        _ => n.toString().padLeft(3, '0'),
      };
    }

    // CONVERT
    time = (time > 86400000) ? 86400000 : time;

    final millisecinds = (time % 1000);
    time ~/= 1000;

    final seconds = time % 60;
    time ~/= 60;

    final minutes = time % 60;
    time ~/= 60;

    final hours = time % 60;

    // RETURN
    return "${twoDigits(hours)} : ${twoDigits(minutes)} : ${twoDigits(seconds)}  ${miliseconds(millisecinds)} ";
  }
}
