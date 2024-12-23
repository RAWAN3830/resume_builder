import 'package:flutter/material.dart';

class SkillSetsScreen extends StatefulWidget {
  const SkillSetsScreen({super.key});

  @override
  State<SkillSetsScreen> createState() => _SkillSetsScreenState();
}

class _SkillSetsScreenState extends State<SkillSetsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _skillController = TextEditingController();
  final Map<String, List<String>> skillCategories = {
    'Languages': [],
    'Libraries/Frameworks': [],
    'Tools/Platforms': [],
    'Databases': [],
  };
  String selectedCategory = 'Languages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Set')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Select Category',
                border: OutlineInputBorder(),
              ),
              items: skillCategories.keys.map((category) => DropdownMenuItem(
                value: category,
                child: Text(category),
              )).toList(),
              onChanged: (value) => setState(() => selectedCategory = value!),
            ),
            const SizedBox(height: 16),
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
                        if (skillCategories[selectedCategory]!.contains(value.trim())) {
                          return 'Skill already exists in this category';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addSkill,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: skillCategories.length,
                itemBuilder: (context, index) {
                  final category = skillCategories.keys.elementAt(index);
                  final skills = skillCategories[category]!;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(category),
                          Text('${skills.length} skills', style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: skills.map((skill) => Chip(
                              label: Text(skill),
                              deleteIcon: const Icon(Icons.close, size: 18),
                              onDeleted: () => _removeSkill(skill, category),
                            )).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addSkill() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        skillCategories[selectedCategory]!.add(_skillController.text.trim());
        _skillController.clear();
      });
    }
  }

  void _removeSkill(String skill, String category) {
    setState(() => skillCategories[category]!.remove(skill));
  }

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }
}
