import 'package:bloc_prac/todo/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) {
          // context.read<TodoBloc>().add(ToggleTodo(todo.id));
        },
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              final controller = TextEditingController(text: todo.title);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Edit Todo"),
                  content: TextField(controller: controller),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // context.read<TodoBloc>().add(UpdateTodo(todo.id, controller.text));
                        Navigator.pop(context);
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // context.read<TodoBloc>().add(DeleteTodo(todo.id));
            },
          ),
        ],
      ),
    );
  }
}
