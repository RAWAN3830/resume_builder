import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../infra/bloc/dynamic_textField_bloc/dynamic_state_bloc.dart';
import '../infra/bloc/dynamic_textField_bloc/dynamic_text_event.dart';
import '../infra/bloc/dynamic_textField_bloc/dynamic_text_state.dart';


class DynamicTextFields extends StatelessWidget {
  const DynamicTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic TextFields with BLoC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<DynamicTextFieldsBloc, DynamicTextFieldsState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.fieldControllers.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: state.fieldControllers[index]['link'],
                                decoration: const InputDecoration(
                                  labelText: 'Link',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width: 2),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: state.fieldControllers[index]['name'],
                                decoration: const InputDecoration(
                                  labelText: 'Link Name',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green, width: 2),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    context
                                        .read<DynamicTextFieldsBloc>()
                                        .add(RemoveFieldEvent(index));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<DynamicTextFieldsBloc>().add(AddFieldEvent());
              },
              child: const Text('Add Fields'),
            ),
          ],
        ),
      ),
    );
  }
}
