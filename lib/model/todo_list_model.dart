import 'package:flutter/material.dart';

class TodlListModel {
  final String id;
  final todoList;
  TodlListModel({required this.id, required this.todoList});
}

class todoList with ChangeNotifier {
  List<TodlListModel> _list = [];
  List<TodlListModel> get list {
    return [..._list];
  }

  void addTodo(String li) {
    _list.insert(
      0,
      TodlListModel(id: DateTime.now().toString(), todoList: li),
    );
    print([...list]);
    notifyListeners();
  }
}
