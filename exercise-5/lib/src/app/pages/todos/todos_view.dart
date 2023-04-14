import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/app/pages/todos/todos_controller.dart';
import 'package:template/src/data/data_todo_repository.dart';

class TodosPage extends View {
  static const route = '/todos';
  const TodosPage({Key? key}) : super(key: key);

  @override
  TodosPageState createState() => TodosPageState();
}

class TodosPageState extends ViewState<TodosPage, TodosController> {
  TodosPageState() : super(TodosController(DataTodoRepository()));

  bool showError = false;

  @override
  Widget get view {
    return ControlledWidgetBuilder<TodosController>(
      builder: (context, controller) {
        return Scaffold(
          key: globalKey,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Todos'),
          ),
          body: ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = controller.todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete Todo'),
                          content: const Text(
                              'Are you sure you want to delete this todo?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () {
                                controller.removeTodoById(todo.id);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(builder: (context, setState) {
                    // <--- StatefulBuilder NOTED
                    return AlertDialog(
                      title: const Text('Add Todo'),
                      content: Form(
                        autovalidateMode: AutovalidateMode.always,
                        child: TextFormField(
                          controller: controller.newTodoTitleController,
                          decoration: InputDecoration(
                            hintText: 'Enter todo title',
                            errorText: showError
                                ? 'Todo title cannot be empty.'
                                : null,
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Add'),
                          onPressed: () {
                            if (controller.newTodoTitleController.text
                                .trim()
                                .isEmpty) {
                              setState(() {
                                showError = true;
                              });
                            } else {
                              controller.addTodo();
                              setState(() {
                                showError = false;
                              });
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    );
                  });
                },
              );
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
