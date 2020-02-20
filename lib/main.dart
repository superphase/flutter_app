import 'package:flutter/material.dart';
import 'pokedata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = "Poke app";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appTitle, home: HomePage(title: appTitle));
  }
}

class HomePage extends StatelessWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: BottomSheet(
        builder: (BuildContext context) {
          return Container(
            child: Text("text1"),
          );
        },
        onClosing: () {
          print("close");
        },
      ),
      body: new MainPage(title: "poke app"),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String myData1 = "images/001.png";
  String myData2 = "images/002.png";
  String myData3 = "images/003.png";
  String myData4 = "images/004.png";
  String myData5 = "images/005.png";
  String myData6 = "images/006.png";
  String enemyData1 = "images/007.png";
  String enemyData2 = "images/008.png";
  String enemyData3 = "images/009.png";
  String enemyData4 = "images/010.png";
  String enemyData5 = "images/011.png";
  String enemyData6 = "images/012.png";
  String targetData = "images/000.png";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 50,
              width: size.width,
              child: BaseStatsArea(
                pokeId: targetData,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: myData1),
                              onTap: () {
                                setState(() {
                                  targetData = myData1;
                                  print(myData1);
                                  _BaseStatsAreaState.of(context).display(myData1);
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: myData2),
                              onTap: () {
                                setState(() {
                                  targetData = myData2;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: myData3),
                              onTap: () {
                                setState(() {
                                  targetData = myData3;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: myData4),
                              onTap: () {
                                setState(() {
                                  targetData = myData4;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      TableRow(children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: PokeBox(img: myData5),
                            onTap: () {
                              setState(() {
                                targetData = myData5;
                              });
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: PokeBox(img: myData6),
                            onTap: () {
                              setState(() {
                                targetData = myData6;
                              });
                            },
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
                Expanded(
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: enemyData1),
                              onTap: () {
                                setState(() {
                                  targetData = enemyData1;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: enemyData2),
                              onTap: () {
                                setState(() {
                                  targetData = enemyData2;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: enemyData3),
                              onTap: () {
                                setState(() {
                                  targetData = enemyData3;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(10.0),
                            child: GestureDetector(
                              child: PokeBox(img: enemyData4),
                              onTap: () {
                                setState(() {
                                  targetData = enemyData4;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      TableRow(children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: PokeBox(img: enemyData5),
                            onTap: () {
                              setState(() {
                                targetData = enemyData5;
                              });
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: PokeBox(img: enemyData6),
                            onTap: () {
                              setState(() {
                                targetData = enemyData6;
                              });
                            },
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: pokeArea(),
        ),
      ],
    );
  }
}

class PokeBox extends StatefulWidget {
  final String img;
  PokeBox({Key key, this.img}) : super(key: key);
  @override
  _PokeBoxState createState() => new _PokeBoxState(boxPoke: img);
}

class _PokeBoxState extends State<PokeBox> {
  String boxPoke;
  _PokeBoxState({this.boxPoke});
  void changeData(data) {
    boxPoke = data;
  }

  @override
  Widget build(BuildContext context) {
    return new DragTarget(
      builder: (context, candidateData, rejectedData) {
        return GestureDetector(
          child: Image.asset(boxPoke, height: 50, width: 50),
        );
      },
      onAccept: (data) {
        changeData(data);
      },
      //child: Image.asset(boxPoke, height: 50, width: 50),
    );
  }
}

class BaseStatsArea extends StatefulWidget {
  final String pokeId;
  BaseStatsArea({Key key, this.pokeId}) : super(key: key);
  @override
  _BaseStatsAreaState createState() => new _BaseStatsAreaState(pokeId: pokeId);
}

class _BaseStatsAreaState extends State<BaseStatsArea> {
  final String pokeId;
  var baseStatsList = [];
  _BaseStatsAreaState({this.pokeId});

  void display(String data) {
    setState(() {
      baseStatsList = baseCalc(data);
    });
  }

  static _BaseStatsAreaState of(BuildContext context) {
    return context.findAncestorStateOfType<State<BaseStatsArea>>();
  }

  baseCalc(String data) {
    print("data: $data");
    String substr = data.substring(7, data.length - 4);
    int subdbl;
    try {
      subdbl = int.parse(substr);
    } catch (exception) {
      subdbl = 0;
      print("error data is not double");
    }
    var list = new List.generate(6, (i) => subdbl);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    display(pokeId);
    print("build baseStats $pokeId");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BaseStatsBox("H", baseStatsList[0]),
        BaseStatsBox("A", baseStatsList[1]),
        BaseStatsBox("B", baseStatsList[2]),
        BaseStatsBox("C", baseStatsList[3]),
        BaseStatsBox("D", baseStatsList[4]),
        BaseStatsBox("S", baseStatsList[5]),
      ],
    );
  }
}
