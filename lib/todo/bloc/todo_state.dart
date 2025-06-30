import 'package:bloc_prac/todo/model/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  @override
  List<Object?> get props => [todos];
}
