import 'package:masterclass/todos/models/todo_model.dart';

import 'package:uno/uno.dart';

import '../service/interface_cliente_todo.dart';

class TodoRepository implements IClienteHttpsTodo {
  final Uno uno;
  TodoRepository(this.uno);

  @override
  bool hasDone = false;

  @override
  Future<List<ToDoModel>> getToDos(int page) async {
    final response = await uno.get(
        'https://jsonplaceholder.typicode.com/todos?_limit=10&_page=$page');
    final list = response.data as List;
    if (response.data?.isEmpty ?? false) {
      hasDone = true;
    }
    return list.map((e) => ToDoModel.fromJson(e)).toList();
  }
}
