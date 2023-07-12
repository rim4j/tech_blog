abstract class ThemeStatus {}

class DarkMode extends ThemeStatus {
  bool isDarkMode;

  DarkMode({
    required this.isDarkMode,
  });
}
