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
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text('Achievements',
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
                      Container(width: 314, child: Textlist[index]),
                      IconButton(
                          onPressed: () {
                            Textlist.removeAt(index);
                            setState(() {
                              
                            });
                          },
                          icon: Icon(CupertinoIcons.delete))
                    ],
                  );
                },
                itemCount: Textlist.length,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Textlist.forEach((element) =>
                    controllList.add(element.achiveController.text));
                setState(() {});
              },
              child: Text(
                'Sumbit'),),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  Textlist.add(DynamicText());
                });

              },
              child: Icon(CupertinoIcons.plus,color: Colors.white,size: 40,))

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: achiveController,
        decoration: InputDecoration(
          hintText: 'increase sales 17% Avearage',
        ),
      ),
    );
  }
}
