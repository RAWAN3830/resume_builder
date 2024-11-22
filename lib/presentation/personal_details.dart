import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume/presentation/common_widgets/common_buttons/common_save_button.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}
enum merital { Single, Merried }
bool isEnglish = false;
bool isGuj = false;
bool isHindi = false;
bool isOff = false;

class _PersonalDetailsState extends State<PersonalDetails> {
  merital g = merital.Single;
  TextEditingController dateInput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    dateInput.text = " ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: const Text('Personal Details',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DOB',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Date of Birth',
                    hintText: 'DD/MM/YYYY'),
              ),
            ),

            Text(
              'Merital Status',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Radio(
                  value: merital.Single,
                  groupValue: g,
                  onChanged: (merital? value) {
                    setState(() {
                      g = value!;
                    });
                  }),
              title: const Text('Single'),
            ),
            ListTile(
              leading: Radio(
                  value: merital.Merried,
                  groupValue: g,
                  onChanged: (merital? value) {
                    setState(() {
                      g = value!;
                    });
                  }),
              title: const Text('Merried'),
            ),

            // RadioListTile(value: merital.Single, groupValue: g, onChanged:(merital? value){
            //   setState(() {
            //     g = value!;
            //   });
            // },title:Text('Merried') ,),
            Text(
              'Languages Known',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
                value: isEnglish,
                onChanged: (value) {
                  setState(() {
                    isEnglish = value!;
                  });
                },
                title: const Text(
                  'English',
                  style: TextStyle(fontSize: 20),
                )),
            CheckboxListTile(
                value: isGuj,
                onChanged: (value) {
                  setState(() {
                    isGuj = value!;
                  });
                },
                title: const Text(
                  'Gujrati',
                  style: TextStyle(fontSize: 20),
                )),
            CheckboxListTile(
                value: isHindi,
                onChanged: (value) {
                  setState(() {
                    isHindi = value!;
                  });
                },
                title: const Text(
                  'Hindi',
                  style: TextStyle(fontSize: 20),
                )),

            Text(
              'Nationality',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    //icon: Icon(Icons.calendar_today),
                    labelText: 'Nationality',
                    hintText: 'Country name'),
              ),
            ),

              Center(child: CommonSaveButton(formKey:formKey,))

            // Switch(value: true, onChanged: (value){
            //  })
          ],
        ),
      ),
    );
  }
}
