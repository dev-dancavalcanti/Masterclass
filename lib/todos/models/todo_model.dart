// ignore_for_file: public_member_api_docs, sort_constructors_first

class ToDoModel {
  ToDoModel({
    required this.title,
    required this.completed,
  });

  final String title;
  late bool completed;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'completed': completed,
    };
  }

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
