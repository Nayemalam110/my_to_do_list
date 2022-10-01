// TODO Implement this library.

import 'package:flutter/material.dart';
import '../model/todo_list_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _taskController = TextEditingController();

  void addList(li) {
    Provider.of<todoList>(context, listen: false).addTodo(li);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('To Do'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _taskController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      ElevatedButton(
                        onPressed: () => addList(_taskController.text),
                        child: const Text('save'),
                      ),
                    ],
                  ),
                ),
              );
            },
            context: context),
      ),
    );
  }
}
