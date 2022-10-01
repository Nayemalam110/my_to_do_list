import 'package:flutter/material.dart';

import 'model/todo_list_model.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        return todoList();
      },
      child: MaterialApp(
        title: 'ToDoList',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
