import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  const NavigatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return MyDetails(itemTitle: 'January');
                },
              ),
            );
          },
          child: const Text('Go to January'),
        ),
      ),
    );
  }
}

class MyDetails extends StatelessWidget {
  const MyDetails({super.key, required this.itemTitle});

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
