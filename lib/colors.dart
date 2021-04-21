import 'dart:ui';

Color colorGray = new Color(0xFF7c7c7c);
Color colorLightGray = new Color(0xFFdedede);
Color colorBlue = new Color(0xFF0971ce);
Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
Color dBlue = _colorFromHex("#0971ce");
Color dBlack= _colorFromHex("#4b4b4b");
Color dGrey= _colorFromHex("#9e9e9e");
Color cBlack= _colorFromHex("#1e1e1e");
Color cSkyBlue= _colorFromHex("#f2f7fd");
Color iBlue = _colorFromHex("#2682d4");
Color iLightBlue = _colorFromHex("#a5cbef");
Color iColor= _colorFromHex("#9e9e9e");