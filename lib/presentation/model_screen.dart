import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.dart';


class ResumeWork extends StatefulWidget {
  const ResumeWork({super.key});

  @override
  State<ResumeWork> createState() => _ResumeWorkState();
}

class _ResumeWorkState extends State<ResumeWork> {
  // List<Map<String, dynamic>> mapData = [
  //   {'icon' : Image.asset('images/achievement.png'),'title' : 'Contact Info'},
  //   {'icon' : Image.asset('images/experience.png'),'title' : 'Carrier Objective'},
  //   {'icon' : Image.asset('images/handshake.png'),'title' : 'Personal Details'},
  // ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 130,
      centerTitle: true,
      backgroundColor: Colors.blue,
      leading: InkWell(
        onTap: (){
          Navigator.of(context).pop();
        },
          child: const Icon(CupertinoIcons.back,color: Colors.white,)),
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Icon(CupertinoIcons.back,color: Colors.white,size: 25),
            Text('Resume Builder',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500)),
                       ],),
        SizedBox(height: 35,),
        Center(child: Text('Build Options',style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)))
      ],),
    ),
    body: SingleChildScrollView(
      child: Column(
        children:modelList.map((e) => Center(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: ListTile(
              leading:Image.asset(e.imageData,width:45),
              title: Text(e.title,style: const TextStyle(fontSize: 18)),
              trailing: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(e.route);
                },
                  child: const Icon(CupertinoIcons.forward)),
            ),
          ),
        )).toList(),
      ),
    ),
  );
  }
}
