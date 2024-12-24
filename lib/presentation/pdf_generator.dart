// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/widgets.dart' as pwd;
//
// class ResumeCreator extends StatefulWidget {
//   @override
//   _ResumeCreatorState createState() => _ResumeCreatorState();
// }
//
// class _ResumeCreatorState extends State<ResumeCreator> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final educationController = TextEditingController();
//
//   // LaTeX-like formatting for PDF generation using Unicode fonts
//   Future<void> createPdf(String name, String email, String education) async {
//     // Load custom font
//     // var data = await rootBundle.load("assets/open-sans.ttf");
//
//     var fontData = await rootBundle.load('assets/fonts/roboto_fonts/Roboto-Regular.ttf');
//     final ttf = pw.Font.ttf(fontData);
//     var  myFonts = pwd.Font.ttf(fontData);
//
//
//     // Create a PDF document
//     final pdf = pw.Document();
//
//     // Add content to the PDF
//     pdf.addPage(
//       pw.Page(
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               'Resume',
//               style: pw.TextStyle(font: ttf, fontSize: 24, fontWeight: pw.FontWeight.bold),
//             ),
//             pw.Divider(),
//             pw.Text('Name: $name', style: pw.TextStyle(font: myFonts, fontSize: 18)),
//             pw.Text('Email: $email', style: pw.TextStyle(font: myFonts, fontSize: 18)),
//             pw.SizedBox(height: 10),
//             pw.Text(
//               'Education:',
//               style: pw.TextStyle(font: ttf, fontSize: 18, fontWeight: pw.FontWeight.bold),
//             ),
//             pw.Text('$education', style: pw.TextStyle(font: myFonts, fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//
//     // Save the PDF locally
//     final output = await getTemporaryDirectory();
//     final file = File('${output.path}/resume.pdf');
//     await file.writeAsBytes(await pdf.save());
//
//     // Notify user
//     print('PDF saved at: ${file.path}');
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('PDF saved at: ${file.path}')),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Create Resume')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: educationController,
//               decoration: InputDecoration(labelText: 'Education'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final name = nameController.text;
//                 final email = emailController.text;
//                 final education = educationController.text;
//                 if (name.isNotEmpty && email.isNotEmpty && education.isNotEmpty) {
//                   createPdf(name, email, education);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Please fill all fields')),
//                   );
//                 }
//               },
//               child: Text('Generate PDF'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pwd;

class ResumeCreator extends StatefulWidget {
  @override
  _ResumeCreatorState createState() => _ResumeCreatorState();
}

class _ResumeCreatorState extends State<ResumeCreator> {
  // LaTeX-like formatting for PDF generation using Unicode fonts
  Future<void> createPdf() async {
    // Load custom font
    var fontData = await rootBundle.load('assets/fonts/roboto_fonts/Roboto-Regular.ttf');
    final ttf = pw.Font.ttf(fontData);
    var myFonts = pwd.Font.ttf(fontData);

    // Create a PDF document
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Resume',
              style: pw.TextStyle(font: ttf, fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(),
            pw.Text('Name: John Doe', style: pw.TextStyle(font: myFonts, fontSize: 18)),
            pw.Text('Email: johndoe@example.com', style: pw.TextStyle(font: myFonts, fontSize: 18)),
            pw.SizedBox(height: 10),
            pw.Text(
              'Education:',
              style: pw.TextStyle(font: ttf, fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text('Bachelor of Science in Computer Science', style: pw.TextStyle(font: myFonts, fontSize: 16)),
          ],
        ),
      ),
    );

    // Save the PDF locally
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/resume.pdf');
    await file.writeAsBytes(await pdf.save());

    // Notify user
    print('PDF saved at: ${file.path}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved at: ${file.path}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Resume')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              createPdf();
            },
            child: Text('Generate PDF'),
          ),
        ),
      ),
    );
  }
}
