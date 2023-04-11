Exercise 1
==========

Objectives:
- Connect `overview` to `todos` using Navigator.of
    - Check `app_router.dart` and don't forget to add `TodosPage` route 
- To be able to learn the `domain` of the Clean Architecture
- To be able to create a class of *Todo* `entity`
- To be able to create a class of *Todo* `repository`

Task Entity
-----------
This entity will have the following properties:
- `id`
- `title`

Task Repository
---------------
This repository should be able to:
- `addTodo()`
- `removeTodo()`
- `updateTodo()`
- `getAllTodos()`
- `getTodo()`