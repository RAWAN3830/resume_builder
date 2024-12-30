import 'package:flutter/services.dart';

class PdfGenerator {
  static const MethodChannel _channel = MethodChannel('pdf_generator');

  static Future<String> generatePdf(String latexCode, String outputFilePath) async {
    try {
      final result = await _channel.invokeMethod('generatePdf', {
        'latexCode': latexCode,
        'outputFilePath': outputFilePath,
      });
      return result;
    } catch (e) {
      throw Exception('Error generating PDF: $e');
    }
  }
}
