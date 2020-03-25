import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'database_helper.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => AppTheme(),
      child: const MyApp(),
    ));

class PokeBoxProvider extends ChangeNotifier {
  String _myData1 = "images/000.png";
  String _myData2 = "images/000.png";
  String _myData3 = "images/000.png";
  String _myData4 = "images/000.png";
  String _myData5 = "images/000.png";
  String _myData6 = "images/000.png";
  String _enemyData1 = "images/000.png";
  String _enemyData2 = "images/000.png";
  String _enemyData3 = "images/000.png";
  String _enemyData4 = "images/000.png";
  String _enemyData5 = "images/000.png";
  String _enemyData6 = "images/000.png";
  String _targetData1 = "images/000.png";
  String _targetData2 = "images/000.png";
  String _pokeAreaType = "ノーマル";

  void setterMyData1(String data) {
    this._myData1 = data;
    notifyListeners();
  }

  void setterMyData2(String data) {
    this._myData2 = data;
    notifyListeners();
  }

  void setterMyData3(String data) {
    this._myData3 = data;
    notifyListeners();
  }

  void setterMyData4(String data) {
    this._myData4 = data;
    notifyListeners();
  }

  void setterMyData5(String data) {
    this._myData5 = data;
    notifyListeners();
  }

  void setterMyData6(String data) {
    this._myData6 = data;
    notifyListeners();
  }

  void setterEnemyData1(String data) {
    this._enemyData1 = data;
    notifyListeners();
  }

  void setterEnemyData2(String data) {
    this._enemyData2 = data;
    notifyListeners();
  }

  void setterEnemyData3(String data) {
    this._enemyData3 = data;
    notifyListeners();
  }

  void setterEnemyData4(String data) {
    this._enemyData4 = data;
    notifyListeners();
  }

  void setterEnemyData5(String data) {
    this._enemyData5 = data;
    notifyListeners();
  }

  void setterEnemyData6(String data) {
    this._enemyData6 = data;
    notifyListeners();
  }

  void setterTargetData(String data, bool isMyTeam) {
    if (isMyTeam) {
      this._targetData1 = data;
    } else {
      this._targetData2 = data;
    }
    notifyListeners();
  }

  void setterPokeAreaType(String data) {
    this._pokeAreaType = data;
    //print('setter=$data');
    notifyListeners();
  }

  getColor(String type) {
    switch (type) {
      case 'ノーマル':
        return Colors.grey;
      case 'ほのお':
        return Colors.redAccent;
      case 'みず':
        return Colors.blue;
      case 'でんき':
        return Colors.yellow;
      case 'くさ':
        return Colors.green;
      case 'こおり':
        return Colors.cyanAccent;
      case 'かくとう':
        return Colors.pink;
      case 'どく':
        return Colors.deepPurpleAccent[100];
      case 'じめん':
        return Colors.brown[700];
      case 'ひこう':
        return Colors.lightBlue[50];
      case 'エスパー':
        return Colors.purpleAccent;
      case 'むし':
        return Colors.lightGreenAccent;
      case 'いわ':
        return Colors.brown[300];
      case 'ゴースト':
        return Colors.deepPurple[700];
      case 'ドラゴン':
        return Colors.deepPurple;
      case 'あく':
        return Colors.black;
      case 'はがね':
        return Colors.blueGrey;
      case 'フェアリー':
        return Colors.pinkAccent;
    }
  }
}

class AppTheme extends ChangeNotifier {
  AppTheme() : _isDark = false;

  bool get isDark => _isDark;
  bool _isDark;

  ThemeData buildTheme() => _isDark ? ThemeData.dark() : ThemeData.light();

  void changeMode() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "poke app",
      theme: Provider.of<AppTheme>(context).buildTheme(),
      darkTheme: ThemeData.dark(),
      home: ChangeNotifierProvider<PokeBoxProvider>(
        create: (content) => PokeBoxProvider(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    final Size size = MediaQuery.of(context).size;
    final double heightUnit = size.height / 32;
    final double baseStatsHeight = heightUnit * 5;
    final double pokeBoxHeight = heightUnit * 12;
    final double pokeAreaHeight = heightUnit * 7;
    return Consumer<PokeBoxProvider>(
      builder: (context, pokeBoxProvider, _) {
        return Scaffold(
          drawer: Container(
            width: size.width * 0.8,
            height: size.height,
            child: Drawer(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: ListView(
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            title: Text('License'),
                            onTap: () => showLicensePage(
                                context: context,
                                applicationName: 'poke app',
                                applicationVersion: '1.1.0'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(
                        IconData(
                          58281,
                          fontFamily: 'MaterialIcons',
                        ),
                      ),
                      onTap: () => theme.changeMode(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Card(
                child: Container(
                  width: size.width,
                  height: baseStatsHeight,
                  color: Colors.amberAccent,
                  child: WidgetBaseStats(
                    isMyTeam: true,
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: size.width,
                  height: baseStatsHeight,
                  color: Colors.amberAccent,
                  child: WidgetBaseStats(
                    isMyTeam: false,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    child: Container(
                      width: 0.9 * size.width / 2,
                      height: pokeBoxHeight,
                      color: Colors.green,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.bottom,
                        children: [
                          TableRow(children: [
                            PokeBoxArea(
                              boxId: "box1",
                              isMyTeam: true,
                            ),
                            PokeBoxArea(
                              boxId: "box2",
                              isMyTeam: true,
                            ),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(
                              boxId: "box3",
                              isMyTeam: true,
                            ),
                            PokeBoxArea(
                              boxId: "box4",
                              isMyTeam: true,
                            ),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(
                              boxId: "box5",
                              isMyTeam: true,
                            ),
                            PokeBoxArea(
                              boxId: "box6",
                              isMyTeam: true,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      width: 0.9 * size.width / 2,
                      height: pokeBoxHeight,
                      color: Colors.lightBlue,
                      child: Table(
                        defaultColumnWidth: const FlexColumnWidth(1.0),
                        children: [
                          TableRow(children: [
                            PokeBoxArea(
                              boxId: "box7",
                              isMyTeam: false,
                            ),
                            PokeBoxArea(
                              boxId: "box8",
                              isMyTeam: false,
                            ),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(
                              boxId: "box9",
                              isMyTeam: false,
                            ),
                            PokeBoxArea(
                              boxId: "box10",
                              isMyTeam: false,
                            ),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(
                              boxId: "box11",
                              isMyTeam: false,
                            ),
                            PokeBoxArea(
                              boxId: "box12",
                              isMyTeam: false,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                child: Container(
                  color: Colors.lightGreenAccent,
                  width: size.width,
                  height: pokeAreaHeight,
                  child: PokeArea2(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PokeBoxArea extends StatelessWidget {
  final String boxId;
  final bool isMyTeam;
  PokeBoxArea({Key key, this.boxId, this.isMyTeam}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PokeBoxProvider>(
      builder: (context, pokeBoxProvider, _) {
        String img;
        switch (boxId) {
          case "box1":
            img = pokeBoxProvider._myData1;
            break;
          case "box2":
            img = pokeBoxProvider._myData2;
            break;
          case "box3":
            img = pokeBoxProvider._myData3;
            break;
          case "box4":
            img = pokeBoxProvider._myData4;
            break;
          case "box5":
            img = pokeBoxProvider._myData5;
            break;
          case "box6":
            img = pokeBoxProvider._myData6;
            break;
          case "box7":
            img = pokeBoxProvider._enemyData1;
            break;
          case "box8":
            img = pokeBoxProvider._enemyData2;
            break;
          case "box9":
            img = pokeBoxProvider._enemyData3;
            break;
          case "box10":
            img = pokeBoxProvider._enemyData4;
            break;
          case "box11":
            img = pokeBoxProvider._enemyData5;
            break;
          case "box12":
            img = pokeBoxProvider._enemyData6;
            break;
        }
        return Container(
          height: 45,
          color: Colors.lightGreenAccent,
          margin: EdgeInsets.all(4.0),
          child: DragTarget(builder: (context, candidateData, rejectedData) {
            return GestureDetector(
                child: Image.asset(img),
                onTap: () => pokeBoxProvider.setterTargetData(img, isMyTeam));
          }, onAccept: (data) {
            switch (boxId) {
              case "box1":
                pokeBoxProvider.setterMyData1(data);
                break;
              case "box2":
                pokeBoxProvider.setterMyData2(data);
                break;
              case "box3":
                pokeBoxProvider.setterMyData3(data);
                break;
              case "box4":
                pokeBoxProvider.setterMyData4(data);
                break;
              case "box5":
                pokeBoxProvider.setterMyData5(data);
                break;
              case "box6":
                pokeBoxProvider.setterMyData6(data);
                break;
              case "box7":
                pokeBoxProvider.setterEnemyData1(data);
                break;
              case "box8":
                pokeBoxProvider.setterEnemyData2(data);
                break;
              case "box9":
                pokeBoxProvider.setterEnemyData3(data);
                break;
              case "box10":
                pokeBoxProvider.setterEnemyData4(data);
                break;
              case "box11":
                pokeBoxProvider.setterEnemyData5(data);
                break;
              case "box12":
                pokeBoxProvider.setterEnemyData6(data);
                break;
            }
          }),
        );
      },
    );
  }
}

class WidgetBaseStats extends StatelessWidget {
  final bool isMyTeam;
  WidgetBaseStats({Key key, this.isMyTeam}) : super(key: key);

  Future _getBaseStatsList(String data) async {
    return await _query(data.substring(7, data.length - 4));
  }

  _query(String pId) async {
    //print('_query.pId=$pId');
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // get single row
    List<String> columnsToSelect = [
      DatabaseHelper.columnId,
      DatabaseHelper.columnName,
      DatabaseHelper.columnH,
      DatabaseHelper.columnA,
      DatabaseHelper.columnB,
      DatabaseHelper.columnC,
      DatabaseHelper.columnD,
      DatabaseHelper.columnS,
      DatabaseHelper.columnType1,
      DatabaseHelper.columnType2,
      DatabaseHelper.columnAbility1,
      DatabaseHelper.columnAbility2,
      DatabaseHelper.columnAbility3,
    ];
    String whereString = '${DatabaseHelper.columnPokeId} = ?';
    List<dynamic> whereArguments = [pId];
    List<Map> result = await db.query(DatabaseHelper.table,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    return [
      result[0][DatabaseHelper.columnName],
      result[0][DatabaseHelper.columnH],
      result[0][DatabaseHelper.columnA],
      result[0][DatabaseHelper.columnB],
      result[0][DatabaseHelper.columnC],
      result[0][DatabaseHelper.columnD],
      result[0][DatabaseHelper.columnS],
      result[0][DatabaseHelper.columnType1],
      result[0][DatabaseHelper.columnType2],
      result[0][DatabaseHelper.columnAbility1],
      result[0][DatabaseHelper.columnAbility2],
      result[0][DatabaseHelper.columnAbility3],
    ];
  }

  _notNullText(data) {
    if (data == null) {
      return Text(' ');
    } else {
      return Text(
        '$data ',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String targetData;
    return Consumer<PokeBoxProvider>(builder: (context, pokeBoxProvider, _) {
      if (isMyTeam) {
        targetData = pokeBoxProvider._targetData1;
      } else {
        targetData = pokeBoxProvider._targetData2;
      }
      return FutureBuilder(
        future: _getBaseStatsList(
          targetData,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data[0].length > 15) {
              return Container(
                  height: size.width,
                  width: size.width * 3 / 16,
                  color: Colors.amberAccent,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _notNullText(snapshot.data[0]),
                        ],
                      ),
                      Row(children: <Widget>[
                        _notNullText(snapshot.data[7]),
                        _notNullText(snapshot.data[8]),
                        _notNullText(snapshot.data[9]),
                        _notNullText(snapshot.data[10]),
                        _notNullText(snapshot.data[11]),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _BaseStatsBox(valueName: "H", value: snapshot.data[1]),
                          _BaseStatsBox(valueName: "A", value: snapshot.data[2]),
                          _BaseStatsBox(valueName: "B", value: snapshot.data[3]),
                          _BaseStatsBox(valueName: "C", value: snapshot.data[4]),
                          _BaseStatsBox(valueName: "D", value: snapshot.data[5]),
                          _BaseStatsBox(valueName: "S", value: snapshot.data[6]),
                        ],
                      ),
                    ],
                  ));
            }
            else {
              return Container(
                  height: size.width,
                  width: size.width * 3 / 16,
                  color: Colors.amberAccent,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _notNullText(snapshot.data[0]),
                          _notNullText(snapshot.data[7]),
                          _notNullText(snapshot.data[8]),
                        ],
                      ),
                      Row(children: <Widget>[
                        _notNullText(snapshot.data[9]),
                        _notNullText(snapshot.data[10]),
                        _notNullText(snapshot.data[11]),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _BaseStatsBox(valueName: "H", value: snapshot.data[1]),
                          _BaseStatsBox(valueName: "A", value: snapshot.data[2]),
                          _BaseStatsBox(valueName: "B", value: snapshot.data[3]),
                          _BaseStatsBox(valueName: "C", value: snapshot.data[4]),
                          _BaseStatsBox(valueName: "D", value: snapshot.data[5]),
                          _BaseStatsBox(valueName: "S", value: snapshot.data[6]),
                        ],
                      ),
                    ],
                  ));
            }
          } else {
            return Container(
              height: 50,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _BaseStatsBox(valueName: "H", value: 0),
                  _BaseStatsBox(valueName: "A", value: 0),
                  _BaseStatsBox(valueName: "B", value: 0),
                  _BaseStatsBox(valueName: "C", value: 0),
                  _BaseStatsBox(valueName: "D", value: 0),
                  _BaseStatsBox(valueName: "S", value: 0),
                ],
              ),
            );
          }
        },
      );
    });
  }
}

class _BaseStatsBox extends StatelessWidget {
  final String valueName;
  final int value;
  const _BaseStatsBox({Key key, this.valueName, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width / 8,
      width: size.width / 7,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(
              valueName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        color: Colors.orange,
      ),
    );
  }
}

LongPressDraggable buildDraggable(String data1) => new LongPressDraggable(
      data: data1,
      child: Image.asset(data1, height: 50, width: 50),
      feedback: Image.asset(data1, fit: BoxFit.cover, height: 60, width: 60),
    );

class PokeArea2 extends StatelessWidget {
  PokeArea2({Key key}) : super(key: key);
  final list = [
    const TypeBox('ノーマル'),
    const TypeBox('ほのお'),
    const TypeBox('みず'),
    const TypeBox('でんき'),
    const TypeBox('くさ'),
    const TypeBox('こおり'),
    const TypeBox('かくとう'),
    const TypeBox('どく'),
    const TypeBox('じめん'),
    const TypeBox('ひこう'),
    const TypeBox('エスパー'),
    const TypeBox('むし'),
    const TypeBox('いわ'),
    const TypeBox('ゴースト'),
    const TypeBox('ドラゴン'),
    const TypeBox('あく'),
    const TypeBox('はがね'),
    const TypeBox('フェアリー'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: GridView.count(
              primary: false,
              padding: EdgeInsets.all(0.0),
              crossAxisCount: 1,
              childAspectRatio: 2,
              children: list,
            )),
        Expanded(
          flex: 5,
          child: SelectedPokeArea(),
        ),
      ],
    );
  }
}

class SelectedPokeArea extends StatelessWidget {
  SelectedPokeArea({Key key}) : super(key: key);

  Future _getPokeAreaList(String type) async {
    //print('_query.Type=$type');

    Database db = await DatabaseHelper.instance.database;

    // get single row
    List<String> columnsToSelect = [
      DatabaseHelper.columnId,
      DatabaseHelper.columnPokeId,
      DatabaseHelper.columnName,
      DatabaseHelper.columnH,
      DatabaseHelper.columnA,
      DatabaseHelper.columnB,
      DatabaseHelper.columnC,
      DatabaseHelper.columnD,
      DatabaseHelper.columnS,
      DatabaseHelper.columnType1,
      DatabaseHelper.columnType2,
      DatabaseHelper.columnAbility1,
      DatabaseHelper.columnAbility2,
      DatabaseHelper.columnAbility3,
    ];
    String whereString =
        '${DatabaseHelper.columnType1} = ? or ${DatabaseHelper.columnType2} = ?';
    List<dynamic> whereArguments = [type, type];
    List<Map> result = await db.query(DatabaseHelper.table,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    var pokeList = [];
    result.forEach((mapData) =>
        pokeList.add('images/${mapData[DatabaseHelper.columnPokeId]}.png'));
    //print(pokeList);
    return pokeList;
  }

  static _createList(List pokeList) {
    List<LongPressDraggable> list = [];
    pokeList.forEach((data) => list.add(buildDraggable(data)));
    //print(list);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokeBoxProvider>(builder: (context, pokeBoxProvider, _) {
      return FutureBuilder(
        future: _getPokeAreaList(pokeBoxProvider._pokeAreaType),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: pokeBoxProvider.getColor(pokeBoxProvider._pokeAreaType),
              child: GridView.count(
                padding: EdgeInsets.all(0.0),
                crossAxisCount: 5,
                children: _createList(snapshot.data),
              ),
            );
          } else {
            return Text('');
          }
        },
      );
    });
  }
}

class TypeBox extends StatelessWidget {
  final type;
  const TypeBox(this.type);

  _textColorChange(type) {
    if (type == 'でんき' || type == 'こおり' || type == 'ひこう' || type == 'むし') {
      return Colors.black;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final pokeState = Provider.of<PokeBoxProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => pokeState.setterPokeAreaType(type),
      child: Container(
        color: pokeState.getColor(type),
        child: Center(
          child: Text(
            type,
            style: TextStyle(
              fontSize: 6,
              color: _textColorChange(type),
            ),
          ),
        ),
      ),
    );
  }
}

/*
class PokeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokeState = Provider.of<PokeBoxProvider>(context, listen: false);
    return GridView.count(
      primary: false,
      crossAxisCount: 6,
      children: <Widget>[
        buildDraggable("images/001.png"),
        buildDraggable("images/002.png"),
        buildDraggable("images/003.png"),
        buildDraggable("images/004.png"),
        buildDraggable("images/005.png"),
        buildDraggable("images/006.png"),
        buildDraggable("images/007.png"),
        buildDraggable("images/008.png"),
        buildDraggable("images/009.png"),
        buildDraggable("images/010.png"),
        buildDraggable("images/011.png"),
        buildDraggable("images/012.png"),
        buildDraggable("images/013.png"),
        buildDraggable("images/014.png"),
        buildDraggable("images/015.png"),
        buildDraggable("images/016.png"),
        buildDraggable("images/017.png"),
        buildDraggable("images/018.png"),
        buildDraggable("images/019.png"),
        buildDraggable("images/020.png"),
        buildDraggable("images/021.png"),
        buildDraggable("images/022.png"),
        buildDraggable("images/023.png"),
        buildDraggable("images/024.png"),
        buildDraggable("images/025.png"),
        buildDraggable("images/026.png"),
        buildDraggable("images/027.png"),
        buildDraggable("images/028.png"),
        buildDraggable("images/029.png"),
        buildDraggable("images/030.png"),
        buildDraggable("images/031.png"),
        buildDraggable("images/032.png"),
        buildDraggable("images/033.png"),
        buildDraggable("images/034.png"),
        buildDraggable("images/035.png"),
        buildDraggable("images/036.png"),
        buildDraggable("images/037.png"),
        buildDraggable("images/038.png"),
        buildDraggable("images/039.png"),
        buildDraggable("images/040.png"),
        buildDraggable("images/041.png"),
        buildDraggable("images/042.png"),
        buildDraggable("images/043.png"),
        buildDraggable("images/044.png"),
        buildDraggable("images/045.png"),
        buildDraggable("images/046.png"),
        buildDraggable("images/047.png"),
        buildDraggable("images/048.png"),
        buildDraggable("images/049.png"),
        buildDraggable("images/050.png"),
        buildDraggable("images/051.png"),
        buildDraggable("images/052.png"),
        buildDraggable("images/053.png"),
        buildDraggable("images/054.png"),
        buildDraggable("images/055.png"),
        buildDraggable("images/056.png"),
        buildDraggable("images/057.png"),
        buildDraggable("images/058.png"),
        buildDraggable("images/059.png"),
        buildDraggable("images/060.png"),
        buildDraggable("images/061.png"),
        buildDraggable("images/062.png"),
        buildDraggable("images/063.png"),
        buildDraggable("images/064.png"),
        buildDraggable("images/065.png"),
        buildDraggable("images/066.png"),
        buildDraggable("images/067.png"),
        buildDraggable("images/068.png"),
        buildDraggable("images/069.png"),
        buildDraggable("images/070.png"),
        buildDraggable("images/071.png"),
        buildDraggable("images/072.png"),
        buildDraggable("images/073.png"),
        buildDraggable("images/074.png"),
        buildDraggable("images/075.png"),
        buildDraggable("images/076.png"),
        buildDraggable("images/077.png"),
        buildDraggable("images/078.png"),
        buildDraggable("images/079.png"),
        buildDraggable("images/080.png"),
        buildDraggable("images/081.png"),
        buildDraggable("images/082.png"),
        buildDraggable("images/083.png"),
        buildDraggable("images/084.png"),
        buildDraggable("images/085.png"),
        buildDraggable("images/086.png"),
        buildDraggable("images/087.png"),
        buildDraggable("images/088.png"),
        buildDraggable("images/089.png"),
        buildDraggable("images/090.png"),
        buildDraggable("images/091.png"),
        buildDraggable("images/092.png"),
        buildDraggable("images/093.png"),
        buildDraggable("images/094.png"),
        buildDraggable("images/095.png"),
        buildDraggable("images/096.png"),
        buildDraggable("images/097.png"),
        buildDraggable("images/098.png"),
        buildDraggable("images/099.png"),
        buildDraggable("images/100.png"),
        buildDraggable("images/101.png"),
        buildDraggable("images/102.png"),
        buildDraggable("images/103.png"),
        buildDraggable("images/104.png"),
        buildDraggable("images/105.png"),
        buildDraggable("images/106.png"),
        buildDraggable("images/107.png"),
        buildDraggable("images/108.png"),
        buildDraggable("images/109.png"),
        buildDraggable("images/110.png"),
        buildDraggable("images/111.png"),
        buildDraggable("images/112.png"),
        buildDraggable("images/113.png"),
        buildDraggable("images/114.png"),
        buildDraggable("images/115.png"),
        buildDraggable("images/116.png"),
        buildDraggable("images/117.png"),
        buildDraggable("images/118.png"),
        buildDraggable("images/119.png"),
        buildDraggable("images/120.png"),
        buildDraggable("images/121.png"),
        buildDraggable("images/122.png"),
        buildDraggable("images/123.png"),
        buildDraggable("images/124.png"),
        buildDraggable("images/125.png"),
        buildDraggable("images/126.png"),
        buildDraggable("images/127.png"),
        buildDraggable("images/128.png"),
        buildDraggable("images/129.png"),
        buildDraggable("images/130.png"),
        buildDraggable("images/131.png"),
        buildDraggable("images/132.png"),
        buildDraggable("images/133.png"),
        buildDraggable("images/134.png"),
        buildDraggable("images/135.png"),
        buildDraggable("images/136.png"),
        buildDraggable("images/137.png"),
        buildDraggable("images/138.png"),
        buildDraggable("images/139.png"),
        buildDraggable("images/140.png"),
        buildDraggable("images/141.png"),
        buildDraggable("images/142.png"),
        buildDraggable("images/143.png"),
        buildDraggable("images/144.png"),
        buildDraggable("images/145.png"),
        buildDraggable("images/146.png"),
        buildDraggable("images/147.png"),
        buildDraggable("images/148.png"),
        buildDraggable("images/149.png"),
        buildDraggable("images/150.png"),
        buildDraggable("images/151.png"),
        buildDraggable("images/152.png"),
        buildDraggable("images/153.png"),
        buildDraggable("images/154-1.png"),
        buildDraggable("images/154-2.png"),
        buildDraggable("images/155-1.png"),
        buildDraggable("images/155-2.png"),
        buildDraggable("images/156.png"),
        buildDraggable("images/157.png"),
        buildDraggable("images/158.png"),
        buildDraggable("images/159.png"),
        buildDraggable("images/160.png"),
        buildDraggable("images/161.png"),
        buildDraggable("images/162.png"),
        buildDraggable("images/163.png"),
        buildDraggable("images/164.png"),
        buildDraggable("images/165.png"),
        buildDraggable("images/166.png"),
        buildDraggable("images/167.png"),
        buildDraggable("images/168.png"),
        buildDraggable("images/169.png"),
        buildDraggable("images/170.png"),
        buildDraggable("images/171.png"),
        buildDraggable("images/172.png"),
        buildDraggable("images/173.png"),
        buildDraggable("images/174.png"),
        buildDraggable("images/175.png"),
        buildDraggable("images/176.png"),
        buildDraggable("images/177.png"),
        buildDraggable("images/178.png"),
        buildDraggable("images/179.png"),
        buildDraggable("images/180.png"),
        buildDraggable("images/181.png"),
        buildDraggable("images/182-1.png"),
        buildDraggable("images/182-2.png"),
        buildDraggable("images/183.png"),
        buildDraggable("images/184.png"),
        buildDraggable("images/185.png"),
        buildDraggable("images/186.png"),
        buildDraggable("images/187.png"),
        buildDraggable("images/188.png"),
        buildDraggable("images/189.png"),
        buildDraggable("images/190.png"),
        buildDraggable("images/191-1.png"),
        buildDraggable("images/191-2.png"),
        buildDraggable("images/191-3.png"),
        buildDraggable("images/191-4.png"),
        buildDraggable("images/192-1.png"),
        buildDraggable("images/192-2.png"),
        buildDraggable("images/192-3.png"),
        buildDraggable("images/192-4.png"),
        buildDraggable("images/193.png"),
        buildDraggable("images/194.png"),
        buildDraggable("images/195.png"),
        buildDraggable("images/196.png"),
        buildDraggable("images/197.png"),
        buildDraggable("images/198.png"),
        buildDraggable("images/199.png"),
        buildDraggable("images/200.png"),
        buildDraggable("images/201.png"),
        buildDraggable("images/202.png"),
        buildDraggable("images/203.png"),
        buildDraggable("images/204.png"),
        buildDraggable("images/205.png"),
        buildDraggable("images/206.png"),
        buildDraggable("images/207.png"),
        buildDraggable("images/208.png"),
        buildDraggable("images/209.png"),
        buildDraggable("images/210.png"),
        buildDraggable("images/211.png"),
        buildDraggable("images/212.png"),
        buildDraggable("images/213.png"),
        buildDraggable("images/214.png"),
        buildDraggable("images/215.png"),
        buildDraggable("images/216.png"),
        buildDraggable("images/217.png"),
        buildDraggable("images/218.png"),
        buildDraggable("images/219.png"),
        buildDraggable("images/220.png"),
        buildDraggable("images/221.png"),
        buildDraggable("images/222.png"),
        buildDraggable("images/223.png"),
        buildDraggable("images/224.png"),
        buildDraggable("images/225.png"),
        buildDraggable("images/226.png"),
        buildDraggable("images/227.png"),
        buildDraggable("images/228.png"),
        buildDraggable("images/229.png"),
        buildDraggable("images/230.png"),
        buildDraggable("images/231.png"),
        buildDraggable("images/232.png"),
        buildDraggable("images/233.png"),
        buildDraggable("images/234.png"),
        buildDraggable("images/235.png"),
        buildDraggable("images/236.png"),
        buildDraggable("images/237.png"),
        buildDraggable("images/238.png"),
        buildDraggable("images/239.png"),
        buildDraggable("images/240.png"),
        buildDraggable("images/241.png"),
        buildDraggable("images/242.png"),
        buildDraggable("images/243.png"),
        buildDraggable("images/244.png"),
        buildDraggable("images/245.png"),
        buildDraggable("images/246.png"),
        buildDraggable("images/247.png"),
        buildDraggable("images/248.png"),
        buildDraggable("images/249.png"),
        buildDraggable("images/250.png"),
        buildDraggable("images/251.png"),
        buildDraggable("images/252.png"),
        buildDraggable("images/253.png"),
        buildDraggable("images/254.png"),
        buildDraggable("images/255.png"),
        buildDraggable("images/256.png"),
        buildDraggable("images/257.png"),
        buildDraggable("images/258.png"),
        buildDraggable("images/259.png"),
        buildDraggable("images/260.png"),
        buildDraggable("images/261.png"),
        buildDraggable("images/262.png"),
        buildDraggable("images/263.png"),
        buildDraggable("images/264.png"),
        buildDraggable("images/265.png"),
        buildDraggable("images/266.png"),
        buildDraggable("images/267.png"),
        buildDraggable("images/268.png"),
        buildDraggable("images/269.png"),
        buildDraggable("images/270.png"),
        buildDraggable("images/271.png"),
        buildDraggable("images/272.png"),
        buildDraggable("images/273.png"),
        buildDraggable("images/274.png"),
        buildDraggable("images/275.png"),
        buildDraggable("images/276.png"),
        buildDraggable("images/277.png"),
        buildDraggable("images/278.png"),
        buildDraggable("images/279.png"),
        buildDraggable("images/280.png"),
        buildDraggable("images/281.png"),
        buildDraggable("images/282.png"),
        buildDraggable("images/283.png"),
        buildDraggable("images/284.png"),
        buildDraggable("images/285.png"),
        buildDraggable("images/286.png"),
        buildDraggable("images/287.png"),
        buildDraggable("images/288.png"),
        buildDraggable("images/289.png"),
        buildDraggable("images/290.png"),
        buildDraggable("images/291.png"),
        buildDraggable("images/292.png"),
        buildDraggable("images/293.png"),
        buildDraggable("images/294.png"),
        buildDraggable("images/295.png"),
        buildDraggable("images/296.png"),
        buildDraggable("images/297.png"),
        buildDraggable("images/298.png"),
        buildDraggable("images/299.png"),
        buildDraggable("images/300.png"),
        buildDraggable("images/301.png"),
        buildDraggable("images/302.png"),
        buildDraggable("images/303.png"),
        buildDraggable("images/304.png"),
        buildDraggable("images/305.png"),
        buildDraggable("images/306.png"),
        buildDraggable("images/307.png"),
        buildDraggable("images/308.png"),
        buildDraggable("images/309.png"),
        buildDraggable("images/310.png"),
        buildDraggable("images/311-1.png"),
        buildDraggable("images/311-2.png"),
        buildDraggable("images/312.png"),
        buildDraggable("images/313.png"),
        buildDraggable("images/314.png"),
        buildDraggable("images/315.png"),
        buildDraggable("images/316.png"),
        buildDraggable("images/317.png"),
        buildDraggable("images/318.png"),
        buildDraggable("images/319.png"),
        buildDraggable("images/320.png"),
        buildDraggable("images/321.png"),
        buildDraggable("images/322.png"),
        buildDraggable("images/323.png"),
        buildDraggable("images/324.png"),
        buildDraggable("images/325.png"),
        buildDraggable("images/326.png"),
        buildDraggable("images/327-1.png"),
        buildDraggable("images/327-2.png"),
        buildDraggable("images/328.png"),
        buildDraggable("images/329.png"),
        buildDraggable("images/330.png"),
        buildDraggable("images/331.png"),
        buildDraggable("images/332-1.png"),
        buildDraggable("images/332-2.png"),
        buildDraggable("images/333-1.png"),
        buildDraggable("images/333-2.png"),
        buildDraggable("images/334-1.png"),
        buildDraggable("images/334-2.png"),
        buildDraggable("images/335.png"),
        buildDraggable("images/336.png"),
        buildDraggable("images/337-1.png"),
        buildDraggable("images/337-2.png"),
        buildDraggable("images/338.png"),
        buildDraggable("images/339.png"),
        buildDraggable("images/340.png"),
        buildDraggable("images/341.png"),
        buildDraggable("images/342.png"),
        buildDraggable("images/343.png"),
        buildDraggable("images/344.png"),
        buildDraggable("images/345.png"),
        buildDraggable("images/346.png"),
        buildDraggable("images/347.png"),
        buildDraggable("images/348.png"),
        buildDraggable("images/349.png"),
        buildDraggable("images/350.png"),
        buildDraggable("images/351.png"),
        buildDraggable("images/352.png"),
        buildDraggable("images/353.png"),
        buildDraggable("images/354.png"),
        buildDraggable("images/355.png"),
        buildDraggable("images/356.png"),
        buildDraggable("images/357.png"),
        buildDraggable("images/358.png"),
        buildDraggable("images/359.png"),
        buildDraggable("images/360.png"),
        buildDraggable("images/361.png"),
        buildDraggable("images/362.png"),
        buildDraggable("images/363.png"),
        buildDraggable("images/364.png"),
        buildDraggable("images/365-1.png"),
        buildDraggable("images/365-2.png"),
        buildDraggable("images/366-1.png"),
        buildDraggable("images/366-2.png"),
        buildDraggable("images/367-1.png"),
        buildDraggable("images/367-2.png"),
        buildDraggable("images/368-1.png"),
        buildDraggable("images/368-2.png"),
        buildDraggable("images/368-3.png"),
        buildDraggable("images/368-4.png"),
        buildDraggable("images/369.png"),
        buildDraggable("images/370-1.png"),
        buildDraggable("images/370-2.png"),
        buildDraggable("images/371.png"),
        buildDraggable("images/372-1.png"),
        buildDraggable("images/372-2.png"),
        buildDraggable("images/372-3.png"),
        buildDraggable("images/372-4.png"),
        buildDraggable("images/372-5.png"),
        buildDraggable("images/372-6.png"),
        buildDraggable("images/373.png"),
        buildDraggable("images/374.png"),
        buildDraggable("images/375.png"),
        buildDraggable("images/376.png"),
        buildDraggable("images/377.png"),
        buildDraggable("images/378.png"),
        buildDraggable("images/379.png"),
        buildDraggable("images/380.png"),
        buildDraggable("images/381.png"),
        buildDraggable("images/382.png"),
        buildDraggable("images/383.png"),
        buildDraggable("images/384.png"),
        buildDraggable("images/385.png"),
        buildDraggable("images/386.png"),
        buildDraggable("images/387.png"),
        buildDraggable("images/388.png"),
        buildDraggable("images/389.png"),
        buildDraggable("images/390.png"),
        buildDraggable("images/391.png"),
        buildDraggable("images/392.png"),
        buildDraggable("images/393.png"),
        buildDraggable("images/394.png"),
        buildDraggable("images/395.png"),
        buildDraggable("images/396.png"),
        buildDraggable("images/397.png"),
        buildDraggable("images/398-1.png"),
        buildDraggable("images/398-2.png"),
        buildDraggable("images/399-1.png"),
        buildDraggable("images/399-2.png"),
        buildDraggable("images/400.png"),
      ],
    );
  }
}
*/
