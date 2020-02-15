import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("pole app"),
      ),
      body: Column(
        children: <Widget>[
          _calcArea(),
          Expanded(
            child: new MainPage(title: "poke app"),
          )
        ],
      ),
    )
        //home: new MainPage(title: 'poke app')
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

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
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
                        child: PokeBox(img: myData1),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(10.0),
                        child: PokeBox(img: myData2),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(10.0),
                        child: PokeBox(img: myData3),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(10.0),
                        child: PokeBox(img: myData4),
                      ),
                    ],
                  ),
                  TableRow(children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10.0),
                      child: PokeBox(img: myData5),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10.0),
                      child: PokeBox(img: myData6),
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
                        child: PokeBox(img: enemyData1),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(10.0),
                        child: PokeBox(img: enemyData2),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(10.0),
                        child: PokeBox(img: enemyData3),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(10.0),
                        child: PokeBox(img: enemyData4),
                      ),
                    ],
                  ),
                  TableRow(children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10.0),
                      child: PokeBox(img: enemyData5),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10.0),
                      child: PokeBox(img: enemyData6),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10.0),
          child: buildDraggable("images/001.png"),
        ),
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10.0),
          child: buildDraggable("images/333.png"),
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
        return Image.asset(boxPoke, height: 50, width: 50);
      },
      onAccept: (data) {
        changeData(data);
      },
      //child: Image.asset(boxPoke, height: 50, width: 50),
    );
  }
}

Draggable buildDraggable(String data1) => new Draggable(
      data: data1,
      child: Image.asset(data1, fit: BoxFit.cover, height: 50, width: 50),
      feedback: Image.asset(data1, fit: BoxFit.cover, height: 50, width: 50),
    );

//DragTarget buildDragTarget(String data1) => new DragTarget(
//  builder: (context, candidateData, rejectedData) {
//    print("DragTarget: $candidateData data1: $data1");
//    return Image.asset(data1, height: 50, width: 50);
//  },
//  onAccept: (data){
//
//  },
//  onLeave: (data){
//    print("leave");
//  },
//);

Widget _calcArea() {
  return Container(
    height: 20.0,
    child: Row(
      children: <Widget>[
        Text("H"),
        Text("A"),
        Text("B"),
        Text("C"),
        Text("D"),
        Text("S"),
      ],
    ),
  );
}
