import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp 위젯: StatelessWidget 상태관리가 필요하지 않는 단순한 형태의 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 테마 설정
      theme: ThemeData(
        // 색상 스키마 설정
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // 머테리얼 버전 설정
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage 위젯: StatefulWidget 상태관리가 필요한 위젯
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  // createState 함수를 호출하여 MyHomePageState 객체를 생성
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// MyHomePageState 클래스: MyHomePage 위젯의 상태를 관리하는 클래스
class _MyHomePageState extends State<MyHomePage> {
  // build 함수: 위젯을 생성하는 함수
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
            width: 300,
            height: 380,
            color: Colors.white,
            child: Column(
              children: [
                _buildRow(),
                SizedBox(height: 10),
                _buildRow(),
                SizedBox(height: 10),
                _buildRow(),
              ],
            )),
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      children: [
        Image.network('https://picsum.photos/120/60'),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, World!',
                style: TextStyle(fontSize: 20, color: Colors.indigo)),
            Text('Dart & Flutter',
                style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
          ],
        ),
      ],
    );
  }
}
