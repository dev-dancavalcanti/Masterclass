import 'package:flutter/widgets.dart';
import 'package:masterclass/todos/models/todo_model.dart';
import '../service/interface_cliente_todo.dart';

class ToDoController extends ChangeNotifier {
  final IClienteHttpsTodo _todo;
  ToDoController(this._todo) {
    getAllTodos();
  }

  ScrollController scrollController = ScrollController();
  List<ToDoModel> toDoList = [];
  bool isLoading = false;
  bool isScrolling = false;
  int page = 1;

  Future<void> toggleLoading() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> toggleScroll() async {
    isScrolling = !isScrolling;
    notifyListeners();
  }

  Future<void> getAllTodos() async {
    toggleLoading();
    toDoList = await _todo.getToDos(page);
    toggleLoading();
  }

  Future<void> infinitScroll() async {
    List<ToDoModel> listDB = toDoList;
    try {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          isScrolling == false) {
        if (!_todo.hasDone) {
          toggleScroll();
          page++;
          toDoList.addAll(await _todo.getToDos(page));
          toggleScroll();
        }
      }
    } catch (e) {
      toDoList = listDB;
    }
  }

  Future<void> checkBoxChanged(bool? value, int index) async {
    toDoList[index].completed = !toDoList[index].completed;
    notifyListeners();
  }
}
