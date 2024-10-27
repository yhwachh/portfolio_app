part of app_ui;

class AppThemeData {
  final UIColorData colors;

  const AppThemeData({
    required this.colors,
  });

  factory AppThemeData.light() {
    return AppThemeData(
      colors: UIColorData.light(),
    );
  }

  factory AppThemeData.dark() {
    return AppThemeData(
      colors: UIColorData.dark(),
    );
  }
}
