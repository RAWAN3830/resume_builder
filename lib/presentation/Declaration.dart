import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_widgets/common_appbar/custome_appbar.dart';

// String? Declarations;
// String? date1;
// String? place;
class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  TextEditingController DeclarationController = TextEditingController();
  // TextEditingController dateController = TextEditingController();
  // TextEditingController placeController = TextEditingController();
 final formKey = GlobalKey<FormState>();

  bool isSwitch = false;

  @override
  void initState() {
    // TODO: implement initState
    // DeclarationController.text = Declarations!;
    // dateController.text = date1!;
    // placeController.text = place!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      backgroundColor: Colors.grey.shade300,
      appBar: const CustomAppBar(title:'Declaration'),

      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Declaration',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Switch(
                      value: isSwitch,
                      onChanged: (value) {
                        setState(() {
                          isSwitch = value;
                        });
                      }),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isSwitch,
            child: Container(
              height: 400,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: (Column(
                children: [
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(right:190),
                    child: Text('Declaration',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 30,right: 30),
                    child: TextFormField(
                      controller: DeclarationController,
                      validator: (value){
                        if(value!.isEmpty)
                        {return 'Marketing';}
                        return null;
                      },
                      onSaved: (value){
                        // Declarations = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Description',),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Divider(color: Colors.black,thickness: 1,height:20,endIndent: 10,indent: 10),
                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                             Text('Date\n',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold),),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: TextField(

                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'DD/MM/YYYY',),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Column(
                          children: [
                            Text('Place(interview venue/city',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold),),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Description',),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                  // ElevatedButton(
                  //     style:ButtonStyle(
                  //       backgroundColor:MaterialStateColor.resolveWith((states) => Colors.blue),
                  //     ),
                  //     onPressed: () {
                  //       if(formKey.currentState!.validate())
                  //       {
                  //         print('submit');
                  //
                  //         var snakebar = SnackBar(content: Text(
                  //             'Edu Sucessfully Saved'));
                  //         ScaffoldMessenger.of(context).showSnackBar(snakebar);
                  //
                  //         formKey.currentState!.save();
                  //       }
                  //     },
                  //     child: Text('Submit',style: TextStyle(fontSize: 18,color: Colors.white),)),
                ],
              )),

            ),
          )
        ],
      ),
    );
  }
}
