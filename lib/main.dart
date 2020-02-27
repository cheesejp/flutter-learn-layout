import 'package:flutter/material.dart';

void main() => runApp(MyTab());

class MyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: LayoutPage(
          title: 'aaa',
        ),
      );
}

class LayoutPage extends StatelessWidget {
  LayoutPage({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter layout demo'),
      ),
      body: Text('It is layout page.'),
    );
  }
}
