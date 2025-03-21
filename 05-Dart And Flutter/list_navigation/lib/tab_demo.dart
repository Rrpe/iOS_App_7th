import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabDemo extends StatelessWidget {
  const TabDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Tab Demo'),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Tab #1',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: 'Tab #2',
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Scaffold(
                  body: Center(
                    child: index == 0
                        ? const Text('Tab #1')
                        : const Text('Tab #2'),
                  ),
                );
              },
            );
          }),
    );
  }
}
