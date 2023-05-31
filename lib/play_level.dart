import 'package:flutter/material.dart';

import './switch_press.dart';

class PlayLevel extends StatefulWidget {
  static const routeName = '/play-level';
  @override
  _PlayLevelState createState() => _PlayLevelState();
}

class _PlayLevelState extends State<PlayLevel> {
  void _flipSwitches(ind, sw) {
    setState(() {
      var counter = 0;
      var switchLocation;

      while (counter < sw[ind]['switchFlip'].length) {
        switchLocation = sw[ind]['switchFlip'][counter];
        if (sw[switchLocation]['switchStatus'] == 'Off')
          sw[switchLocation]['switchStatus'] = 'On';
        else if (sw[switchLocation]['switchStatus'] == 'On')
          sw[switchLocation]['switchStatus'] = 'Off';
        counter = counter + 1;
      }
    });
  }

  void _resetSwitches(levelReset, levelData) {
    setState(() {
      var counter = 0;

      while (counter < 8) {
        if (levelReset.contains(counter))
          levelData[counter]['switchStatus'] = 'On';
        else levelData[counter]['switchStatus'] = 'Off';     
        counter = counter + 1;
      }
    });
  }

  String _didWin(List<Map<String, Object>> sw, levelWon) {
    String phrase = 'You win switches. Good on you, champ.';
    for (var i = 0; i <= 8; i++) {
      if (sw[i]['switchStatus'] == 'Off') {
        phrase = '';
      }
    }
    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final levelId = routeArgs['levelId'];
    final levelReset = routeArgs['levelReset'];
    var levelData = routeArgs['levelData'];
    var levelWon = routeArgs['levelWon'];

    return Scaffold(
      appBar: AppBar(title: Text('Level $levelId')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Text(
            'Turn on all the switches to win.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'Blue is on.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Text(
            'Red is off.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return SwitchPress(
                  index: index,
                  flipSwitches: _flipSwitches,
                  switchProperties: levelData,
                );
              }),
            ),
          ),
          Text(
            _didWin(levelData, levelWon),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          FlatButton(
            child: Text('Restart Game?'),
            onPressed: () => _resetSwitches(levelReset, levelData),
          ),
        ]),
      ),
    );
  }
}
