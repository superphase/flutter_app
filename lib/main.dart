import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqflite;
//path.join();
import 'pokedata.dart';

void main() => runApp(MyApp());

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
  String _targetData = "images/000.png";

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

  void setterTargetData(String data) {
    this._targetData = data;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "poke app",
      home: ChangeNotifierProvider<PokeBoxProvider>(
        create: (content) => PokeBoxProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightUnit = size.height / 16;
    return Consumer<PokeBoxProvider>(
      builder: (context, pokeBoxProvider, _) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                child: Container(
                  width: size.width,
                  height: heightUnit * 2,
                  child: WidgetBaseStats(img: pokeBoxProvider._targetData),
                ),
              ),
              Card(
                child: Container(
                  width: size.width,
                  height: heightUnit * 6,
                  child: Row(
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
                ),
              ),
              Card(
                child: Container(
                  width: size.width,
                  height: heightUnit * 5,
                  child: PokeArea(),
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
  PokeBoxArea({Key key, this.boxId}) : super(key: key);
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
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10.0),
          child: DragTarget(builder: (context, candidateData, rejectedData) {
            return GestureDetector(
                child: Image.asset(img, height: 50, width: 50),
                onTap: () => pokeBoxProvider.setterTargetData(img));
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
  WidgetBaseStats({Key key, this.img}) : super(key: key);
  final String img;

  List baseCalc(String data) {
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
    final Size size = MediaQuery.of(context).size;
    final List baseStatsList = baseCalc(img);
    return Consumer<PokeBoxProvider>(builder: (context, pokeBoxProvider, _) {
      return Container(
        height: 50,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _BaseStatsBox(valueName: "H", value: baseStatsList[0]),
            _BaseStatsBox(valueName: "A", value: baseStatsList[1]),
            _BaseStatsBox(valueName: "B", value: baseStatsList[2]),
            _BaseStatsBox(valueName: "C", value: baseStatsList[3]),
            _BaseStatsBox(valueName: "D", value: baseStatsList[4]),
            _BaseStatsBox(valueName: "S", value: baseStatsList[5]),
          ],
        ),
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
    final pokeState = Provider.of<PokeBoxProvider>(context, listen: false);
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

LongPressDraggable buildDraggable(String data1) => new LongPressDraggable(
      data: data1,
      child: Image.asset(data1, height: 50, width: 50),
      feedback: Image.asset(data1, fit: BoxFit.cover, height: 50, width: 50),
    );

class PokeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokeState = Provider.of<PokeBoxProvider>(context, listen: false);
    return GridView.count(
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
        buildDraggable("images/154.png"),
        buildDraggable("images/155.png"),
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
        buildDraggable("images/182.png"),
        buildDraggable("images/183.png"),
        buildDraggable("images/184.png"),
        buildDraggable("images/185.png"),
        buildDraggable("images/186.png"),
        buildDraggable("images/187.png"),
        buildDraggable("images/188.png"),
        buildDraggable("images/189.png"),
        buildDraggable("images/190.png"),
        buildDraggable("images/191.png"),
        buildDraggable("images/192.png"),
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
        buildDraggable("images/311.png"),
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
        buildDraggable("images/327.png"),
        buildDraggable("images/328.png"),
        buildDraggable("images/329.png"),
        buildDraggable("images/330.png"),
        buildDraggable("images/331.png"),
        buildDraggable("images/332.png"),
        buildDraggable("images/333.png"),
        buildDraggable("images/334.png"),
        buildDraggable("images/335.png"),
        buildDraggable("images/336.png"),
        buildDraggable("images/337.png"),
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
        buildDraggable("images/365.png"),
        buildDraggable("images/366.png"),
        buildDraggable("images/367.png"),
        buildDraggable("images/368.png"),
        buildDraggable("images/369.png"),
        buildDraggable("images/370.png"),
        buildDraggable("images/371.png"),
        buildDraggable("images/372.png"),
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
        buildDraggable("images/398.png"),
        buildDraggable("images/399.png"),
        buildDraggable("images/400.png"),
      ],
    );
  }
}
