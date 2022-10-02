import 'package:flutter/material.dart';

class TodlListModel {
  final String id;
  final String todoListtask;
  TodlListModel({
    required this.id,
    required this.todoListtask,
  });
}

class todoList with ChangeNotifier {
  List<TodlListModel> _list = [];
  List<TodlListModel> get listitem {
    return [..._list];
  }

  void addTodo(String li) {
    _list.insert(
      0,
      TodlListModel(id: DateTime.now().toString(), todoListtask: li),
    );

    notifyListeners();
  }
}
