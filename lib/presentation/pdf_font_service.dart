import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfFontService {
  static Future<pw.Font> getFont() async {
    final fontData = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
    return pw.Font.ttf(fontData);
  }
}