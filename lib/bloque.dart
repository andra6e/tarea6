import 'dart:async';
import 'package:todo/model.dart';

class TodoBloc {
  final List<Todo> _todoList = [];
  final _todoController = StreamController<List<Todo>>.broadcast();

  Stream<List<Todo>> get todos => _todoController.stream;

  void addTodo(Todo todo) {
    _todoList.add(todo);
    _todoController.sink.add(_todoList);
  }

  void updateTodo(Todo todo) {
    final index = _todoList.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todoList[index] = todo;
      _todoController.sink.add(_todoList);
    }
  }

  void deleteTodo(Todo todo) {
    _todoList.removeWhere((t) => t.id == todo.id);
    _todoController.sink.add(_todoList);
  }

  void dispose() {
    _todoController.close();
  }
}
