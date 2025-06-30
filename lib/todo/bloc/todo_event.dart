import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodo extends TodoEvent {
  final String title;
  const AddTodo(this.title);

  @override
  List<Object?> get props => [title];
}

class UpdateTodo extends TodoEvent {
  final int id;
  final String title;
  const UpdateTodo(this.id, this.title);

  @override
  List<Object?> get props => [id, title];
}

class DeleteTodo extends TodoEvent {
  final int id;
  const DeleteTodo(this.id);

  @override
  List<Object?> get props => [id];
}

class ToggleTodo extends TodoEvent {
  final int id;
  const ToggleTodo(this.id);

  @override
  List<Object?> get props => [id];
}
