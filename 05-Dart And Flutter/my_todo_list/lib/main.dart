import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter Todo List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListScreen(),
      ),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter a task',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      todoProvider.addTask(_controller.text);
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = todoProvider.tasks[index];
                return Dismissible(
                  key: Key(task.title),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    todoProvider.removeTask(index);
                  },
                  child: ListTile(
                    leading: Checkbox(
                      value: task.isDone,
                      onChanged: (value) {
                        todoProvider.toggleTask(index);
                      },
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration:
                            task.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editTask(context, todoProvider, index, task.title);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            todoProvider.addTask(_controller.text);
            _controller.clear();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _editTask(BuildContext context, TodoProvider provider, int index,
      String currentTitle) {
    TextEditingController controller =
        TextEditingController(text: currentTitle);
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS; // 변경된 부분

    showDialog(
      context: context,
      builder: (context) {
        return isIOS
            ? CupertinoAlertDialog(
                title: Text('Edit Task'),
                content: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CupertinoTextField(
                    controller: controller,
                    placeholder: 'Enter new task name',
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Save'),
                    onPressed: () {
                      provider.updateTask(index, controller.text);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: Text('Edit Task'),
                content: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Enter new task name'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      provider.updateTask(index, controller.text);
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              );
      },
    );
  }
}

class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}

class TodoProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TodoProvider() {
    loadTasks();
  }

  void addTask(String title) {
    _tasks.add(Task(title: title));
    saveTasks();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    saveTasks();
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    saveTasks();
    notifyListeners();
  }

  void updateTask(int index, String newTitle) {
    _tasks[index].title = newTitle;
    saveTasks();
    notifyListeners();
  }

  void saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> taskJson =
        _tasks.map((task) => json.encode(task.toJson())).toList();
    prefs.setStringList('tasks', taskJson);
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskJson = prefs.getStringList('tasks');
    if (taskJson != null) {
      _tasks =
          taskJson.map((task) => Task.fromJson(json.decode(task))).toList();
      notifyListeners();
    }
  }
}
