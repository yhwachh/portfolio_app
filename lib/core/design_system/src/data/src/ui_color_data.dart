part of app_ui;

class UIColorData {
  final Color bgColor;
  final Color textColor;
  final Color fgColor;
  final Color borderColor;

  const UIColorData(
      {required this.bgColor,
      required this.textColor,
      required this.fgColor,
      required this.borderColor});

  factory UIColorData.light() {
    return const UIColorData(
      bgColor: wigth,
      textColor: black,
      fgColor: gray50,
      borderColor: gray200,
    );
  }

  factory UIColorData.dark() => const UIColorData(
        bgColor: black,
        textColor: wigth,
        fgColor: Color.fromARGB(255, 39, 39, 40),
        borderColor: Color.fromARGB(255, 143, 138, 138),
      );

  // Primary
  static const Color wigth = Color(0xffF8FAFA);
  static const Color black = Color.fromARGB(255, 13, 13, 13);
  static const Color gray200 = Color(0xffE5E7EB);
  static const Color gray50 = Color(0xffF9FAFB);
}
