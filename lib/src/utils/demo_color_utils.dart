import 'dart:math';
import 'dart:ui';

class DemoColorUtils {
  static const List<String> hex16ColorCodes = [
    "#448AFF", // blueAccent
    "#7986CB", // indigo[300]
    "#FFC107", // amber
    "#00BCD4", // cyan
    "#4FC3F7", // lightBlue[300]
    "#FFAB40", // orangeAccent
    "#4CAF50", // green
    "#69F0AE", // greenAccent
    "#AED581", // lightGreen[300]
    "#90A4AE", // blueGrey[300]
  ];

  static String getRandomHex16ColorCode() {
    return hex16ColorCodes[Random().nextInt(hex16ColorCodes.length)];
  }

  // @hexColorCode: "#448AFF"
  static Color fromHex16ColorCode({
    required String hexColorCode,
    required Color defaultColor,
  }) {
    try {
      final hexCode = hexColorCode.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    } catch (e) {
      return defaultColor;
    }
  }
}
