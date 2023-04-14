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
                    controller.removeTodoById(todo.id);
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: Navigate to add screen
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
