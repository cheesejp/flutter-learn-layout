import 'package:flutter/material.dart';
import 'package:layout/pages/layout.dart';
import 'package:layout/pages/list-wheel-scroll-view-page.dart';

void main() => runApp(MyTab());

class MyTab extends StatelessWidget {
  final List<Widget> pages = [
    LayoutPage(),
    ListWheelScrollViewPage(title: 'ListWheelScrollView Demo')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: pages.length, child: TabBarView(children: pages)),
    );
  }
}
