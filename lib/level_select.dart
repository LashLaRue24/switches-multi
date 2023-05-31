import 'package:flutter/material.dart';

import './play_level.dart';

class LevelSelect extends StatelessWidget {
  final int levelId;
  final List<Map<String, Object>> levelData;
  final List<int> levelReset;
  final bool levelWon;

  LevelSelect({
    this.levelId,
    this.levelWon,
    this.levelReset,
    this.levelData,
  });

  void enterLevel(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PlayLevel.routeName, arguments: {
      'levelId': levelId,
      'levelWon': levelWon,
      'levelReset': levelReset,
      'levelData': levelData,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => enterLevel(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          'Level $levelId $levelWon',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
