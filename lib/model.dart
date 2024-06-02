import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String title;
  final bool isCompleted;

  Todo({
    String? id,
    required this.title,
    required this.isCompleted,
  }) : id = id ?? Uuid().v4();

  Todo copyWith({String? id, String? title, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
