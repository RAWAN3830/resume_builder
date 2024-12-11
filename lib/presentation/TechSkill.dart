import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_widgets/common_appbar/custome_appbar.dart';

class SkillSets extends StatefulWidget {
  const SkillSets({super.key});

  @override
  State<SkillSets> createState() => _SkillSetsState();
}

class _SkillSetsState extends State<SkillSets> {
  List<DynamicTextField> textFieldList = [];
  List<String> controllerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Skilled'),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(width: 340, child: textFieldList[index]),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            textFieldList.removeAt(index);

                            for (var element in textFieldList) {
                              controllerList
                                  .remove(element.skillController.text);
                            }
                            setState(() {
                              //   textFieldList.forEach((element) => controllerList.remove(element.skillController.text));
                            });
                            //  print(controllerList);
                            //textFieldList.DynamicTextField());
                          });
                        },
                        icon: const Icon(Icons.delete))
                  ],
                );
              },
              itemCount: textFieldList.length,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                for (var element in textFieldList) {
                  controllerList.add(element.skillController.text);
                }
                setState(() {});
                print(controllerList);
              },
              child: const Text('Submit'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textFieldList.add(DynamicTextField());
            // controllerList.add(textFieldList.last.c)
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DynamicTextField extends StatelessWidget {
  TextEditingController skillController = TextEditingController();

  DynamicTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: skillController,
      decoration: const InputDecoration(
        hintText: 'Enter',
      ),
    );
  }
}
