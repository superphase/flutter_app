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
    final Size size = MediaQuery.of(context).size;
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
      body: MainPage(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: size.width,
                  child: WidgetBaseStats(),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            PokeBoxArea(boxId: "box1"),
                            PokeBoxArea(boxId: "box2"),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(boxId: "box3"),
                            PokeBoxArea(boxId: "box4"),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(boxId: "box5"),
                            PokeBoxArea(boxId: "box6"),
                          ]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            PokeBoxArea(boxId: "box7"),
                            PokeBoxArea(boxId: "box8"),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(boxId: "box9"),
                            PokeBoxArea(boxId: "box10"),
                          ]),
                          TableRow(children: [
                            PokeBoxArea(boxId: "box11"),
                            PokeBoxArea(boxId: "box12"),
                          ]),
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
        ),
      ),
    );
  }
}

class _MyInheritedWidget extends InheritedWidget {
  _MyInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MainPageState data;

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
    return true;
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  MainPageState createState() => new MainPageState();

  static MainPageState of(BuildContext context, {bool rebuild = true}) {
    return rebuild
        ? context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>().data
        : context
            .getElementForInheritedWidgetOfExactType<_MyInheritedWidget>()
            .widget;
  }
}

class MainPageState extends State<MainPage> {
  String myData1 = "images/000.png";
  String myData2 = "images/000.png";
  String myData3 = "images/000.png";
  String myData4 = "images/000.png";
  String myData5 = "images/000.png";
  String myData6 = "images/000.png";
  String enemyData1 = "images/000.png";
  String enemyData2 = "images/000.png";
  String enemyData3 = "images/000.png";
  String enemyData4 = "images/000.png";
  String enemyData5 = "images/000.png";
  String enemyData6 = "images/000.png";
  String targetData = "images/000.png";

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(child: widget.child, data: this);
  }
}

class PokeBoxArea extends StatelessWidget {
  final String boxId;
  PokeBoxArea({Key key, this.boxId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final MainPageState state = MainPage.of(context);
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10.0),
      child: PokeBox(boxId: boxId),
    );
  }
}

class PokeBox extends StatelessWidget {
  final String boxId;
  PokeBox({Key key, this.boxId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainPageState state = MainPage.of(context);
    final Map m = {
      "box1": state.myData1,
      "box2": state.myData2,
      "box3": state.myData3,
      "box4": state.myData4,
      "box5": state.myData5,
      "box6": state.myData6,
      "box7": state.enemyData1,
      "box8": state.enemyData2,
      "box9": state.enemyData3,
      "box10": state.enemyData4,
      "box11": state.enemyData5,
      "box12": state.enemyData6,
    };
    return DragTarget(
        builder: (context, candidateData, rejectedData) {
          return GestureDetector(
            child: Image.asset(m[boxId], height: 50, width: 50),
            onTap: () {
              state.targetData = m[boxId];
              print("${state.targetData}");
            },
          );
        },
        onAccept: (data) => m[boxId] = data);
  }
}

//class PokeBox extends StatefulWidget {
//  final String img;
//  PokeBox({Key key, this.img}) : super(key: key);
//  @override
//  _PokeBoxState createState() => new _PokeBoxState(boxPoke: img);
//}
//
//class _PokeBoxState extends State<PokeBox> {
//  String boxPoke;
//  _PokeBoxState({this.boxPoke});
//  void changeData(data) {
//    boxPoke = data;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final MainPageState state = MainPage.of(context);
//    print(state);
//    return new DragTarget(
//      builder: (context, candidateData, rejectedData) {
//        return GestureDetector(
//          child: Image.asset(boxPoke, height: 50, width: 50),
//        );
//      },
//      onAccept: (data) {
//        state.
//        changeData(data);
//      },
//    );
//  }
//}

class WidgetBaseStats extends StatelessWidget {
  WidgetBaseStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final MainPageState state = MainPage.of(context);
    final String pokeId = state.targetData;
    print("basestate$pokeId");
    return Container(
      height: 50,
      width: size.width,
      child: BaseStatsArea(pokeId: pokeId),
    );
  }
}

class BaseStatsArea extends StatelessWidget {
  final String pokeId;
  BaseStatsArea({Key key, this.pokeId}) : super(key: key);

  baseCalc(String data) {
    print("data: $data");
    String subStr = data.substring(7, data.length - 4);
    int subDbl;
    try {
      subDbl = int.parse(subStr);
    } catch (exception) {
      subDbl = 0;
      print("error data is not double");
    }
    var list = new List.generate(6, (i) => subDbl);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List baseStatsList = baseCalc(pokeId);
    print("build baseStats $pokeId");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BaseStatsBox(valueName: "H", value: baseStatsList[0]),
        BaseStatsBox(valueName: "A", value: baseStatsList[1]),
        BaseStatsBox(valueName: "B", value: baseStatsList[2]),
        BaseStatsBox(valueName: "C", value: baseStatsList[3]),
        BaseStatsBox(valueName: "D", value: baseStatsList[4]),
        BaseStatsBox(valueName: "S", value: baseStatsList[5]),
      ],
    );
  }
}

class BaseStatsBox extends StatelessWidget{
  final String valueName;
  final int value;
  BaseStatsBox({Key key, this.valueName, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Card(
        child: Center(
          child: Text(valueName + value.toString()),
        ),
        color: Colors.orange,
      ),
    );
  }
}