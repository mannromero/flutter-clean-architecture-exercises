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

  final List<String> todos = ['Task 1', 'Task 2', 'Task 3'];

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(todos[index]),
            onTap: () {
              // TODO: Navigate to edit screen
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
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
  }
}
