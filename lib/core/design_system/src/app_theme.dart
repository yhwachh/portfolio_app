part of app_ui;

class AppTheme extends InheritedWidget {
  const AppTheme({
		super.key,
		required this.data,
		required super.child,
	});

	final AppThemeData data;

	static AppThemeData of(BuildContext context)
		=> context.dependOnInheritedWidgetOfExactType<AppTheme>()!.data;

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
		return data != oldWidget.data;
  }
}