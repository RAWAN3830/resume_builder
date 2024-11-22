import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume/presentation/Achievements.dart';
import 'package:resume/presentation/Declaration.dart';
import 'package:resume/presentation/References.dart';
import 'package:resume/presentation/TechSkill.dart';
import 'package:resume/presentation/personal_details.dart';

import 'Education.dart';
import 'Experiences.dart';
import 'Project.dart';
import 'carrier_objectibve.dart';
import 'contact_info.dart';
import 'model_screen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.blue));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        '/':(context)=>const ResumeWork(),
        'homepage':(context)=>const MyHomePage(title: 'RESUMES'),
        'resumework':(context)=>const ResumeWork(),
        'contact':(context)=>ContactInfo(),
        'carrier':(context)=>CarrierObjective(),
        'personal':(context)=>PersonalDetails(),
        'education':(context)=>EducationInfo(),
        'experiences':(context)=>const ExperienceInfo(),
        'techskills':(context)=>TechSkills(),
        'project':(context)=>ProjectEmp(),
        'reference':(context)=>Reference(),
        'declaration':(context)=>declaration(),
        'achievements':(context)=>const Achievement(),

      },
      initialRoute: 'homepage',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         toolbarHeight: 130,
        backgroundColor:Colors.blue,
        title: const Column(children: [
          Center(child: Text('Resume Builder',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)),),
          SizedBox(height: 35,),
          Center(child: Text('RESUMES',style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500)))
        ],),

      ),
      body: const Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('images/open-cardboard-box.png'),width: 80),
             Text(
              'No Resume + Create new Resume',
            style: TextStyle(fontSize:22),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
              Navigator.of(context).pushNamed('resumework');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
