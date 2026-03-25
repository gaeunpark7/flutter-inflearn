// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
