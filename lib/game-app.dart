// ==================================================================================================================
// このレイアウトを自力で作れるように試してみる
// https://github.com/cybdom/game_app
// ==================================================================================================================

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/global.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<Widget> __list = List<Widget>.generate(
    //   10,
    //   (index) => Container(
    //     decoration: BoxDecoration(
    //       color: Colors.green,
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(30),
    //       ),
    //     ),
    //     child: Center(
    //       child: CircleAvatar(
    //         backgroundColor: Colors.white,
    //         child: Text('$index'),
    //       ),
    //     ),
    //   ),
    // );

    List<Widget> __list = List<Widget>.generate(
        gamesList.length, (index) => GameContainer(game: gamesList[index]));

    Widget _sample = StaggeredGridView.countBuilder(
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      primary: false,
      crossAxisCount: 4,
      itemCount: __list.length,
      itemBuilder: (ctx, id) {
        return __list[id];
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(2, index.isEven ? 3 : 2);
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: _sample,
            )),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _searchForm = TextFormField(
      decoration: const InputDecoration(
        hintText: 'Search for your favorite game...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(15.0),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );

    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(10).add(
        EdgeInsets.only(top: 10, bottom: 10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Hi Cybdom!',
                  style: Theme.of(context).textTheme.title.apply(
                        color: Colors.white,
                      ),
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.pngarts.com/files/5/Darth-Maul-PNG-Image-Background.png'),
              ),
            ],
          ),
          SizedBox(height: 10),
          _searchForm,
          SizedBox(height: 10),
          TabMenu(),
        ],
      ),
    );
  }
}

class TabMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  int _selected = 0;
  List<String> _items;
  TextStyle _style;
  TextStyle _selectedStyle;
  final double _separateSize = 5.0;
  final Widget _underBar = Container(
    height: 5.0,
    width: 10.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );

  @override
  void didChangeDependencies() {
    _style = Theme.of(context).primaryTextTheme.body1.apply(
          color: Colors.white,
          fontSizeDelta: 2,
        );
    _selectedStyle = this._style.apply(fontWeightDelta: 2);

    _items = List<String>.generate(
      70,
      (index) => 'menu $index',
    );
    super.didChangeDependencies();
  }

  void onTap(int index) {
    setState(() {
      this._selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(
          width: 20,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => onTap(index),
          child: Column(
            children: <Widget>[
              Text(
                this._items[index],
                style: index == _selected ? _selectedStyle : _style,
              ),
              SizedBox(height: _separateSize),
              index == _selected ? _underBar : Container(),
            ],
          ),
        ),
        itemCount: this._items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class GameContainer extends StatelessWidget {
  GameContainer({@required this.game});
  final Map<String, dynamic> game;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                game['imgurl'],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black26, Colors.black],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      game['name'],
                      style: Theme.of(context)
                          .primaryTextTheme
                          .body1
                          .apply(fontSizeDelta: 8.0),
                    ),
                    RatingWidget(rating: game['rating']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  RatingWidget({@required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          color: Colors.white,
        ),
        width: 45,
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Text(
              rating?.toString() ?? '0.0',
              style: Theme.of(context)
                  .primaryTextTheme
                  .body1
                  .apply(color: Colors.orange),
            ),
          ],
        ),
      );
}
