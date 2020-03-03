// ==================================================================================================================
// このレイアウトを自力で作れるように試してみる
// https://github.com/cybdom/game_app
// ==================================================================================================================

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(),
            Text('game-app'),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _texts = List<String>.generate(70, (index) => 'item $index');
    Widget _sizeBox = Row(
      children: <Widget>[
        SizedBox(
          height: 25,
          width: 100,
          child: ListView.builder(
            itemBuilder: (context, index) => Text(_texts[index]),
            itemCount: _texts.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );

    Widget _searchForm = TextFormField(
      decoration: const InputDecoration(
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
          Text('list'),
        ],
      ),
    );
  }
}
