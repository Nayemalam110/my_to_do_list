import 'package:flutter/material.dart';
import '../model/todo_list_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _taskController = TextEditingController();

  void addList(String li, context) {
    Provider.of<todoList>(context, listen: false).addTodo(li);
    setState(() {
      Navigator.of(context).pop();
      _taskController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('To Do'),
                content: Column(
                  children: [
                    TextFormField(
                      controller: _taskController,
                    ),
                    ElevatedButton(
                      onPressed: () => addList(_taskController.text, context),
                      child: const Text('save'),
                    ),
                  ],
                ),
              );
            },
            context: context),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loadData = Provider.of<todoList>(context);
    return ListView.builder(
      itemCount: loadData.listitem.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Card(
            child: Text(loadData.listitem[index].todoListtask),
          ),
        );
      },
    );
  }
}
