import 'package:bloc/bloc.dart';
import 'package:bloc_prac/todo/model/todo_model.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
//
//add todo 

    });
  }
}
