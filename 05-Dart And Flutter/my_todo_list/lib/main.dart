import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Map<String, dynamic>> _todoList = [];

  @override
  void initState() {
    super.initState();
    _loadTodoList();
  }

  // 할 일 목록 로드
  Future<void> _loadTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todoString = prefs.getString('todo_list');
    if (todoString != null) {
      setState(() {
        _todoList = List<Map<String, dynamic>>.from(json.decode(todoString));
      });
    }
  }

  // 할 일 목록 저장
  Future<void> _saveTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('todo_list', json.encode(_todoList));
  }

  // 할 일 추가
  void _addTodo(String title) {
    setState(() {
      _todoList.add({'title': title, 'done': false});
    });
    _saveTodoList();
  }

  // 할 일 삭제
  void _deleteTodo(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
    _saveTodoList();
  }

  // 완료 상태 변경
  void _toggleDone(int index) {
    setState(() {
      _todoList[index]['done'] = !_todoList[index]['done'];
    });
    _saveTodoList();
  }

  // 할 일 입력 다이얼로그
  void _showAddTodoDialog() {
    String newTodo = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("새 할 일 추가"),
          content: TextField(
            onChanged: (value) => newTodo = value,
            decoration: InputDecoration(hintText: "할 일을 입력하세요"),
          ),
          actions: [
            TextButton(
              child: Text("취소"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("추가"),
              onPressed: () {
                if (newTodo.trim().isNotEmpty) {
                  _addTodo(newTodo.trim());
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("간단한 Todo 앱")),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          final todo = _todoList[index];
          return Dismissible(
            key: Key(todo['title']),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => _deleteTodo(index),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: Checkbox(
                value: todo['done'],
                onChanged: (value) => _toggleDone(index),
              ),
              title: Text(
                todo['title'],
                style: TextStyle(
                  decoration: todo['done'] ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddTodoDialog,
      ),
    );
  }
}
