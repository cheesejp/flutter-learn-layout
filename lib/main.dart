import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListWheelScrollView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ListWheelScrollView Demo'),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({@required this.title, @required this.height, this.subtitle});
  final String title;
  final String subtitle;
  final double height;

  @override
  Widget build(BuildContext context) {
    assert(title != null, 'MyCardウィジェットのタイトルが空です。文字列を入力してください。');
    return Container(
      height: height,
      child: Align(
        alignment: Alignment.center,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Text(title),
                subtitle: Text(subtitle ?? 'This is subtitle.'),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Hoge'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('Huga'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyCard> _cards = List<MyCard>();
  List<Widget> _texts = List<Widget>();
  static final double tileSize = 144.0;

  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      _texts.add(Container(
        height: tileSize,
        color: Colors.amber,
        child: Align(
          alignment: Alignment.center,
          child: Text('Text $i'),
        ),
      ));
      _cards.add(MyCard(
        title: 'Card $i',
        height: tileSize,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _buildListWheelScrollView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  ListWheelScrollView _buildListWheelScrollView() =>
      // ListWheelScrollView(itemExtent: tileSize, children: _cards);
      ListWheelScrollView(itemExtent: tileSize, children: _texts);
}
