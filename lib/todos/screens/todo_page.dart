import 'package:flutter/material.dart';
import 'package:masterclass/controllers/app_controller.dart';
import 'package:masterclass/todos/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final controller = context.read<ToDoController>();
    controller.scrollController.addListener(() {
      controller.infinitScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ToDoController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new)),
            const Text(
              'ToDo',
            ),
            const SizedBox()
          ],
        ),
        elevation: 0,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.toDoList.length + 1,
              controller: controller.scrollController,
              itemBuilder: (context, index) {
                if (index < controller.toDoList.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: Text(
                                    controller.toDoList[index].title,
                                    // textScaleFactor: .95,
                                  ),
                                ),
                              ],
                            ),
                            Checkbox(
                                value: controller.toDoList[index].completed,
                                onChanged: (value) {
                                  controller.checkBoxChanged(value, index);
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
    );
  }
}
