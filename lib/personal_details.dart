import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

enum merital { Single, Merried }

final formkey = GlobalKey<FormState>;

bool isEnglish = false;
bool isGuj = false;
bool isHindi = false;
bool isOff = false;

class _PersonalDetailsState extends State<PersonalDetails> {
  merital g = merital.Single;
  TextEditingController dateInput = TextEditingController();
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
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Text('Personal Details',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Text(
              'DOB',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.calendar_today),
                  labelText: 'Date of Birth',
                  hintText: 'DD/MM/YYYY'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 240),
            child: Text(
              'Merital Status',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
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
            title: Text('Single'),
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
            title: Text('Merried'),
          ),

          // RadioListTile(value: merital.Single, groupValue: g, onChanged:(merital? value){
          //   setState(() {
          //     g = value!;
          //   });
          // },title:Text('Merried') ,),
          Padding(
            padding: const EdgeInsets.only(right: 180),
            child: Text(
              'Languages Known',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          CheckboxListTile(
              value: isEnglish,
              onChanged: (value) {
                setState(() {
                  isEnglish = value!;
                });
              },
              title: Text(
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
              title: Text(
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
              title: Text(
                'Hindi',
                style: TextStyle(fontSize: 20),
              )),

          Padding(
            padding: const EdgeInsets.only(right: 260),
            child: Text(
              'Nationality',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //icon: Icon(Icons.calendar_today),
                  labelText: 'Nationality',
                  hintText: 'Country name'),
            ),
          ),

          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
              ),
              onPressed: () {
                //   if (formkey.currentState!.validate()) {
                //     print('Submit');
                //     formkey.currentState!.save();
                //
                //     var snackbar = SnackBar(
                //         content: Text('Contact Info Submitted sucessfully.'));
                //     ScaffoldMessenger.of(context)
                //         .showSnackBar(snackbar);
                //   }
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),

          // Switch(value: true, onChanged: (value){
          //  })
        ],
      ),
    );
  }
}
