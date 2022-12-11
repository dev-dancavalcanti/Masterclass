import 'package:masterclass/todos/models/todo_model.dart';

abstract class IClienteHttpsTodo {
  bool hasDone = false;

  Future<List<ToDoModel>> getToDos(int page) async {
    return [];
  }
}
