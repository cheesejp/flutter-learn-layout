// ==========================================================================================================
// https://flutter.dev/docs/development/ui/layout/tutorial
// ==========================================================================================================
import 'package:flutter/material.dart';
import 'package:layout/game-app.dart';
import 'package:layout/layout.dart';

const MODE_LAYOUT = 'layout';
const MODE_GAME_APP = 'game-app';

void main() => runApp(
      MyTab(
        mode: MODE_GAME_APP,
        // mode: MODE_LAYOUT,
      ),
    );

class MyTab extends StatelessWidget {
  MyTab({@required this.mode});
  final String mode;

  @override
  Widget build(BuildContext context) {
    if (mode == MODE_GAME_APP) {
      return MaterialApp(
        home: GameApp(),
        theme: ThemeData(
          fontFamily: 'QuickSand',
        ),
      );
    } else {
      return MaterialApp(
        home: LayoutPage(
          title: 'Layout Demo',
        ),
      );
    }
  }
}
