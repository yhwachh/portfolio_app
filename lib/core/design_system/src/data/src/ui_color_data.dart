part of app_ui;

class UIColorData {
  final Color bgColor;
  final Color textColor;

  const UIColorData({
    required this.bgColor,
    required this.textColor,
  });

  factory UIColorData.light() {
    return const UIColorData(
      bgColor: wigth,
      textColor: black,
    );
  }

  factory UIColorData.dark() => const UIColorData(
        bgColor: black,
        textColor: wigth,
      );

  // Primary
  static const Color wigth = Color(0xffF8FAFA);
  static const Color black = Color.fromARGB(255, 13, 13, 13);
  static const Color gray200 = Color(0xffE5E7EB);
  static const Color gray50 = Color(0xffF9FAFB);
}
