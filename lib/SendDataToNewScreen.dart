import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Send Data',
      home: TodosScreen(
          todos: List.generate(
              20,
              (i) => Todo('Todo $i',
                  'A description of what needs to be done for Todo $i'))),
    );
  }
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.separated(
        itemCount: todos.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
//          if (index.isOdd) return new Divider();
//          final pos = index ~/
//              2; // we are dividing position by 2 and returning an integer result
//          int subStrImg = 1;
//          if (int.parse(todos[index]
//                  .title
//                  .substring(todos[index].title.length - 1)) ==
//              9) subStrImg = 2;
          return new ListTile(
            title: Text(todos[index].title),
            leading: new CircleAvatar(
              backgroundColor: Colors.green,
              child: new Text(
                "${index}",
                style: new TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.normal),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Todo todo;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(todo.description),
        ),
      ),
    );
    ;
  }
}
