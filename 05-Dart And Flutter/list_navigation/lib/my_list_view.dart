import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListDataItems {
  final List<String> monthItems = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ListDataItems item = ListDataItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.monthItems.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text(item.monthItems[index]),
              const SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}
