import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("poke app"),
            ),
            drawer: Drawer(
                child: Center(child: Text("drawer"))
            ),
            body: Column(
              children: <Widget>[
                _calcArea(),
                _pokeArea(150.0),
                _partyArea(),
              ],
            ) // This trailing comma makes auto-formatting nicer for build methods.
        )
    );
  }

  Widget _calcArea() {
    return Container(
        height: 10.0,
        child: Row(
          children: <Widget>[
            Text("H"),
            Text("S"),
          ],
        )
    );
  }

  Widget _pokeArea(double size) {
    var list = [
      _pokephoto("001"),
      _pokephoto("002"),
      _pokephoto("003"),
      _pokephoto("004"),
      _pokephoto("005"),
      _pokephoto("006"),
      _pokephoto("007"),
      _pokephoto("008"),
      _pokephoto("009"),
      _pokephoto("010"),
      _pokephoto("011"),
      _pokephoto("012"),
      _pokephoto("013"),
      _pokephoto("014"),
      _pokephoto("015"),
      _pokephoto("016"),
      _pokephoto("017"),
      _pokephoto("018"),
      _pokephoto("019"),
      _pokephoto("020"),
      _pokephoto("000"),
    ];
    return Container(
      height: size,
      child: GridView.count(
          crossAxisCount: 6,
          children: list
      ),
    );
  }

  Widget _pokephoto(String image) {
    var assetsImage = "images/" + image + ".png";
    return Container(
        child: new Draggable(
          data: assetsImage,
          child: Container(
            child: Image.asset(assetsImage, fit: BoxFit.cover, height: 50, width: 50),
          ),
          feedback: Container(
            child: Image.asset(assetsImage, height: 50, width: 50),
          ),
        ),
    );
  }

  Widget _partyArea() {
    return Container(
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow( children: [
            Column(children: <Widget>[
              _imageDropArea(),
              _imageDropArea(),
              _imageDropArea(),
            ]),
            Column(children: <Widget>[
              _imageDropArea(),
              _imageDropArea(),
              _imageDropArea(),
            ]),
          ])
        ],
      ),
    );
  }

  Widget _imageDropArea() {
    return  DragTarget(
        builder: (contest, candidateData, rejectData) {
          return new Container(
            width: 50,
            height: 50,
            color: Colors.red,
          );
        },
        onAccept: (data){
          print("A");
          },
    );
  }
}
