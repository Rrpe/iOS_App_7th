import 'package:flutter/material.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Shared preference Demo')),
        body: Center(
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Enter your username',
            ),
            controller: _controller,
          ),
        ));
  }
}
