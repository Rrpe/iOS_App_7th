import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<String>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = _loadMonths();
  }

  Future<List<String>> _loadMonths() async {
    String jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/example.json');
    return jsonDecode(jsonString).values.cast<String>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('My Data App')),
        body: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(data[index]));
              },
            );
          },
        ),
      ),
    );
  }
}
