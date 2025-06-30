import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoController extends Cubit<String> {
  TodoController(super.initialState);

  var todo = {};
  //add todo
  void addTodo() {
    todo.addAll(todo);
  }
  //read todo
}
