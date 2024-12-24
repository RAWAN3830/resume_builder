import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import 'common_widgets/common_appbar/custome_appbar.dart';



class Achievement extends StatefulWidget {
  const Achievement({super.key});

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  List<DynamicText> Textlist = [];
  List<String> controllList = [];
  // List<Dynam>
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final educationController = TextEditingController();

  // LaTeX template with placeholders
  String latexTemplate = """
  \\documentclass[a4paper,10pt]{article}
  \\usepackage[utf8]{inputenc}
  \\usepackage{geometry}
  \\geometry{top=1in, bottom=1in, left=1in, right=1in}
  \\begin{document}
  \\begin{center}
      {\\LARGE {{name}}}\\\\[0.5em]
      Email: {{email}} \\\\
  \\end{center}
  \\section*{Education}
  \\begin{itemize}
      \\item {{education}}
  \\end{itemize}
  \\end{document}
  """;

  Future<void> createPdf() async {
    // Replace placeholders with user inputs
    final latexContent = latexTemplate
        .replaceAll('{{name}}', nameController.text)
        .replaceAll('{{email}}', emailController.text)
        .replaceAll('{{education}}', educationController.text);

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Center(
          child: pw.Text("LaTeX to PDF rendering not available directly"),
        ),
      ),
    );

    // Save PDF locally
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/resume.pdf");
    await file.writeAsBytes(await pdf.save());

    // Share or preview the PDF

  }
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text('Create Resume')),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       children: [
    //         TextField(
    //           controller: nameController,
    //           decoration: InputDecoration(labelText: 'Name'),
    //         ),
    //         TextField(
    //           controller: emailController,
    //           decoration: InputDecoration(labelText: 'Email'),
    //         ),
    //         TextField(
    //           controller: educationController,
    //           decoration: InputDecoration(labelText: 'Education'),
    //         ),
    //         SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: createPdf,
    //           child: Text('Generate PDF'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
return Scaffold(
  appBar: const CustomAppBar(title:'Achievements'),
  body: Column(
    children: [
      Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(width: 314, child: Textlist[index]),
                  IconButton(
                      onPressed: () {
                        Textlist.removeAt(index);
                        setState(() {

                        });
                      },
                      icon: const Icon(CupertinoIcons.delete))
                ],
              );
            },
            itemCount: Textlist.length,
          ),
        ),
      ),
      ElevatedButton(
          onPressed: () {
            for (var element in Textlist) {
              controllList.add(element.achiveController.text);
            }
            setState(() {});
          },
          child: const Text(
            'Sumbit'),),
      ElevatedButton(
          style: const ButtonStyle(
              // backgroundColor:WidgetStateColor.resolveWith((states) => Colors.blue),
          ),
          onPressed: () {
            setState(() {
              Textlist.add(DynamicText());
            });

          },
          child: const Icon(CupertinoIcons.plus,color: Colors.white,size: 40,))

      // Container(
      //   height: 70,
      //   width: 300,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(15),
      //       color: Colors.blue,),
      //   //child: Center(child: Icon(CupertinoIcons.plus,color: Colors.white,size: 40),),
      //
      // )
    ],
  ));
    // );
  }
}

class DynamicText extends StatelessWidget {
  TextEditingController achiveController = TextEditingController();

  DynamicText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: achiveController,
        decoration: const InputDecoration(
          hintText: 'increase sales 17% Avearage',
        ),
      ),
    );
  }
}


