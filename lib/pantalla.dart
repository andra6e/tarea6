// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:todo/bloque.dart';
import 'package:todo/model.dart';

class TodoScreen extends StatelessWidget {
  final TodoBloc _bloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: StreamBuilder<List<Todo>>(
        stream: _bloc.todos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final todos = snapshot.data!;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    _bloc.updateTodo(todo.copyWith(isCompleted: value));
                  },
                ),
                title: Text(todo.title),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _bloc.deleteTodo(todo);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddTodoDialog(context);
        },
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final _textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar tarea'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Coloque el titulo de la tarea'),
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () {
                _bloc.addTodo(Todo(
                  title: _textController.text,
                  isCompleted: false,
                ));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
