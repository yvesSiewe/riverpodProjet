class TodoModel {
  final String todo;
  final bool isDone;

  TodoModel({
    required this.todo,
    this.isDone = false,
  });

  TodoModel copyWith({
    String? todo,
    bool? isDone,
  }) {
    return TodoModel(
      todo: todo ?? this.todo,
      isDone: isDone ?? this.isDone,
    );
  }
}