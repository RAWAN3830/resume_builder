import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Achievement extends StatefulWidget {
  const Achievement({super.key});

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  List<DynamicText> Textlist = [];
  List<String> controllList = [];
  // List<Dynam>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text('Achievements',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
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
              style: ButtonStyle(
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
      ),
    );
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
