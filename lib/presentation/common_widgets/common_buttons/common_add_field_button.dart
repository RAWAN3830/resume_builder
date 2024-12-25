import 'package:flutter/cupertino.dart';

class CommonAddFieldButton extends StatelessWidget {
  final Function onTap;
  final String name;
  const CommonAddFieldButton({super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
         onTap();
        },
        child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CupertinoColors.black,width: 1)
            ),
            child: Center(
              child: Text(' + $name',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
            )));
  }
}
