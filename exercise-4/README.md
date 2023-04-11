Exercise 4
==========

Objectives:
- To be able to how to use `Presenter`
- Write `Function`s that will connect the following usecases
    - `add_todo_usecase`
        - `Function? addTodoOnNext`
        - `Function? addTodoOnComplete`
        - `Function? addTodoOnError`
    - `remove_todo_usecase`
        - `Function? removeTodoOnNext`
        - `Function? removeTodoOnComplete`
        - `Function? removeTodoOnError`
    - `update_todo_usecase`
        - `Function? updateTodoOnNext`
        - `Function? updateTodoOnComplete`
        - `Function? updateTodoOnError`
    - `get_all_todos_usecase`
        - `Function? getAllTodosOnNext`
        - `Function? getAllTodosOnComplete`
        - `Function? getAllTodosOnError`
    - `get_todo_usecase`
        - `Function? getTodoOnNext`
        - `Function? getTodoOnComplete`
        - `Function? getTodoOnError`
- Write `Observer`s that is connected to the `Presenter`
    - `_AddTodoUseCaseObserver`
    - `_RemoveTodoUseCaseObserver`
    - `_UpdateTodoUseCaseObserver`
    - `_GetAllTodosUseCaseObserver`
    - `_GetTodoUseCaseObserver`
     