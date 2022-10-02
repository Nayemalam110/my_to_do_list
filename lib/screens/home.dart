import 'package:flutter/material.dart';
import '../model/todo_list_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _taskController = TextEditingController();

  void addList(String li, context) {
    Provider.of<todoList>(context, listen: false).addTodo(li);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final loadData = Provider.of<todoList>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: loadData.listitem.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Card(
              child: Text(loadData.listitem[index].todoListtask),
            ),
          );
        },
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
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Cannot be empty';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      ElevatedButton(
                        onPressed: () => addList(_taskController.text, context),
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
