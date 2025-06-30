import 'package:bloc_prac/todo/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  int _idCounter = 0;

  TodoBloc() : super(const TodoState()) {
    on<AddTodo>((event, emit) {
      final newTodo = Todo(id: _idCounter++, title: event.title);
      emit(TodoState(todos: [...state.todos, newTodo]));
    });

    on<UpdateTodo>((event, emit) {
      final updatedTodos = state.todos.map((todo) {
        return todo.id == event.id ? todo.copyWith(title: event.title) : todo;
      }).toList();
      emit(TodoState(todos: updatedTodos));
    });

    on<DeleteTodo>((event, emit) {
      final filteredTodos =
          state.todos.where((todo) => todo.id != event.id).toList();
      emit(TodoState(todos: filteredTodos));
    });

    on<ToggleTodo>((event, emit) {
      final toggledTodos = state.todos.map((todo) {
        return todo.id == event.id
            ? todo.copyWith(isCompleted: !todo.isCompleted)
            : todo;
      }).toList();
      emit(TodoState(todos: toggledTodos));
    });
  }
}
