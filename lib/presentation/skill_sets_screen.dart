import 'package:flutter/material.dart';
import 'package:resume/core/constant/theme_colors.dart';
import 'package:resume/presentation/common_widgets/common_textfields/comman_textformfield.dart';

import 'package:flutter/material.dart';

import 'common_widgets/common_appbar/custome_appbar.dart';

class SkillSetsScreen extends StatefulWidget {
  const SkillSetsScreen({super.key});

  @override
  State<SkillSetsScreen> createState() => _SkillSetsScreenState();
}

List<String> chipData = [];

class _SkillSetsScreenState extends State<SkillSetsScreen> {
  final TextEditingController _skillController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:const CustomAppBar(title: 'Skill Set',),
      // appBar: AppBar(
      //   title: const Text('Technical Skills'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _skillController,
                      decoration: const InputDecoration(
                        labelText: 'Add a skill',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a skill';
                        }
                        if (chipData.contains(value.trim())) {
                          return 'Skill already exists';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          chipData.add(_skillController.text.trim());
                          _skillController.clear();
                        });
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: List.generate(
                  chipData.length,
                      (index) => GestureDetector(
                    onTap: () {},
                    child: Chip(
                      onDeleted: () {
                        setState(() {
                          chipData.removeAt(index);
                        });
                      },
                      deleteIcon: const Icon(Icons.close,
                          size: 18, color: Colors.black),
                      labelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black),
                      ),
                      label: Text(
                        chipData[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                      backgroundColor: ThemeColors.mainGreenColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }
}
