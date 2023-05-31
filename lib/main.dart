import 'package:flutter/material.dart';

import './play_level.dart';
import './level_select.dart';
import './level_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Switches'),
      routes: {
        PlayLevel.routeName: (ctx) => PlayLevel(),
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: LEVEL_DATA
            .map((levelData) => LevelSelect(
                  levelId: levelData.levelId,
                  levelWon: levelData.levelWon,
                  levelReset: levelData.levelReset,
                  levelData: levelData.levelData,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
