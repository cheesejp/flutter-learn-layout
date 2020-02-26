import 'package:flutter/material.dart';

class MyItem extends StatelessWidget {
  MyItem({@required this.title, @required this.height, this.subtitle});
  final String title;
  final String subtitle;
  final double height;

  @override
  Widget build(BuildContext context) {
    assert(title != null, 'MyCardウィジェットのタイトルが空です。文字列を入力してください。');
    return Container(
      height: height,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5.0),
      color: Colors.grey,
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
                onPressed: () {
                  print('Hoge.');
                },
              ),
              FlatButton(
                child: const Text('Huga'),
                onPressed: () {
                  print('Huga.');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListWheelScrollViewPage extends StatefulWidget {
  ListWheelScrollViewPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListWheelScrollViewPageState createState() => _ListWheelScrollViewPageState();
}

class _ListWheelScrollViewPageState extends State<ListWheelScrollViewPage> {
  List<MyItem> _cards = List<MyItem>();
  static final double tileSize = 170.0;

  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      _cards.add(MyItem(
        title: 'Item $i',
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
        onPressed: () {
          print('Action');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  ListWheelScrollView _buildListWheelScrollView() => ListWheelScrollView(
        itemExtent: tileSize,
        children: _cards,
        // squeeze: 1.0,
        // diameterRatio: 0.7,
        // magnification: 1.1,
        // useMagnifier: true,
      );
}
