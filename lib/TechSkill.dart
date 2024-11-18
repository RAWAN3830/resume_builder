import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechSkills extends StatefulWidget {
  const TechSkills({super.key});

  @override
  State<TechSkills> createState() => _TechSkillsState();
}

class _TechSkillsState extends State<TechSkills> {
  List<DynamicTextField> textFieldList = [];
  List<String> controllerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text('Technical Skills',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(width: 340, child: textFieldList[index]),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            textFieldList.removeAt(index);

                             //textFieldList.forEach((element) => controllerList.remove(element.skillController.text));
                            setState(() {
                           //   textFieldList.forEach((element) => controllerList.remove(element.skillController.text));

                            });
                          //  print(controllerList);
                            //textFieldList.DynamicTextField());

                          });
                        },
                        icon: Icon(Icons.delete))
                  ],
                );
              },
              itemCount: textFieldList.length,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                textFieldList.forEach((element) =>
                    controllerList.add(element.skillController.text));
                setState(() {

                });
                 print(controllerList);
              },
              child: Text('Submit'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textFieldList.add(DynamicTextField());
            // controllerList.add(textFieldList.last.c)
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DynamicTextField extends StatelessWidget {
  TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: skillController,
        decoration: InputDecoration(
          hintText: 'Enter',
        ),
      ),
    );
  }
}
