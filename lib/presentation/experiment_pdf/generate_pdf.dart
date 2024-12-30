import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'pdf_generator.dart';

Future<void> generateResume() async {
  const latexCode = r'''
  \documentclass{article}
  \begin{document}
  Hello, this is a LaTeX-generated PDF from Flutter!
  \end{document}
  ''';

  final outputDir = await getApplicationDocumentsDirectory();
  final outputFilePath = '${outputDir.path}/resume.pdf';

  try {
    final result = await PdfGenerator.generatePdf(latexCode, outputFilePath);
    print(result);
    print('PDF saved at $outputFilePath');
  } catch (e) {
    print('Error: $e');
  }
}
