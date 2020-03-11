import "dart:io";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart"
    show getApplicationDocumentsDirectory;

class DatabaseHelper {
  static final _databaseName = "pokeDatabase";
  static final _databaseVersion = 1;
  static final table = 'poke_table';
  static final columnId = '_id';
  static final columnPokeId = 'pokeid';
  static final columnName = 'name';
  static final columnH = 'H';
  static final columnA = 'A';
  static final columnB = 'B';
  static final columnC = 'C';
  static final columnD = 'D';
  static final columnS = 'S';
  static final columnType1 = 'type1';
  static final columnType2 = 'type2';
  static final columnAbility1 = 'ability1';
  static final columnAbility2 = 'ability2';
  static final columnAbility3 = 'ability3';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    deleteDatabase(path);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
    $columnId INTEGER PRIMARY KEY,
    $columnPokeId TEXT NOT NULL UNIQUE,
    $columnName TEXT NOT NULL UNIQUE,
    $columnH INTEGER NOT NULL, 
    $columnA INTEGER NOT NULL, 
    $columnB INTEGER NOT NULL, 
    $columnC INTEGER NOT NULL, 
    $columnD INTEGER NOT NULL, 
    $columnS INTEGER NOT NULL, 
    $columnType1 TEXT NOT NULL, 
    $columnType2 TEXT, 
    $columnAbility1 TEXT NOT NULL,
    $columnAbility2 TEXT, 
    $columnAbility3 TEXT)
    ''');

    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('000', '', 0, 0, 0, 0, 0, 0, '', null, '', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('001', 'サルノリ', 50, 65, 50, 40, 40, 65, 'くさ', null, 'しんりょく', null, 'グラスメイカー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('002', 'バチンキー', 70, 85, 70, 55, 60, 80, 'くさ', null, 'しんりょく', null, 'グラスメイカー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('003', 'ゴリランダー', 100, 125, 90, 60, 70, 85, 'くさ', null, 'しんりょく', null, 'グラスメイカー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('004', 'ヒバニー', 50, 71, 40, 40, 40, 69, 'ほのお', null, 'もうか', null, 'リベロ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('005', 'ラビフット', 65, 86, 60, 55, 60, 94, 'ほのお', null, 'もうか', null, 'リベロ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('006', 'エースバーン', 80, 116, 75, 65, 75, 119, 'ほのお', null, 'もうか', null, 'リベロ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('007', 'メッソン', 50, 40, 40, 70, 40, 70, 'みず', null, 'げきりゅう', null, 'スナイパー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('008', 'ジメレオン', 65, 60, 55, 95, 55, 90, 'みず', null, 'げきりゅう', null, 'スナイパー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('009', 'インテレオン', 70, 85, 65, 125, 65, 120, 'みず', null, 'げきりゅう', null, 'スナイパー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('010', 'サッチムシ', 25, 20, 20, 25, 45, 45, 'むし', null, 'むしのしらせ', 'ふくがん', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('011', 'レドームシ', 50, 35, 80, 50, 90, 30, 'むし', 'エスパー', 'むしのしらせ', 'ふくがん', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('012', 'イオルブ', 60, 45, 110, 80, 120, 90, 'むし', 'エスパー', 'むしのしらせ', 'おみとおし', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('013', 'キャタピー', 45, 30, 35, 20, 20, 45, 'むし', null, 'りんぷん', null, 'にげあし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('014', 'トランセル', 50, 20, 55, 25, 25, 30, 'むし', null, 'だっぴ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('015', 'バタフリー', 60, 45, 50, 90, 80, 70, 'むし', 'ひこう', 'ふくがん', null, 'いろめがね')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('016', 'アゴジムシ', 47, 62, 45, 55, 45, 46, 'むし', null, 'むしのしらせ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('017', 'デンチムシ', 57, 82, 95, 55, 75, 36, 'むし', 'でんき', 'バッテリー', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('018', 'クワガノン', 77, 70, 90, 145, 75, 43, 'むし', 'でんき', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('019', 'ホーホー', 60, 30, 30, 36, 56, 50, 'ノーマル', 'ひこう', 'ふみん', 'するどいめ', 'いろめがね')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('020', 'ヨルノズク', 100, 50, 50, 86, 96, 70, 'ノーマル', 'ひこう', 'ふみん', 'するどいめ', 'いろめがね')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('021', 'ココガラ', 38, 47, 35, 33, 35, 57, 'ひこう', null, 'するどいめ', 'きんちょうかん', 'はとむね')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('022', 'アオガラス', 68, 67, 55, 43, 55, 77, 'ひこう', null, 'するどいめ', 'きんちょうかん', 'はとむね')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('023', 'アーマーガア', 98, 87, 105, 53, 85, 67, 'はがね', 'ひこう', 'プレッシャー', 'きんちょうかん', 'ミラーアーマー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('024', 'ホシガリス', 70, 55, 55, 35, 35, 25, 'ノーマル', null, 'ほおぶくろ', null, 'くいしんぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('025', 'ヨクバリス', 120, 95, 95, 55, 75, 20, 'ノーマル', null, 'ほおぶくろ', null, 'くいしんぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('026', 'マメパト', 50, 55, 50, 36, 30, 43, 'ノーマル', 'ひこう', 'はとむね', 'きょううん', 'とうそうしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('027', 'ハトーボー', 62, 77, 62, 50, 42, 65, 'ノーマル', 'ひこう', 'はとむね', 'きょううん', 'とうそうしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('028', 'ケンホロウ', 80, 105, 80, 65, 55, 93, 'ノーマル', 'ひこう', 'はとむね', 'きょううん', 'とうそうしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('029', 'クスネ', 40, 28, 28, 47, 52, 50, 'あく', null, 'にげあし', 'かるわざ', 'はりこみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('030', 'フォクスライ', 70, 58, 58, 87, 92, 90, 'あく', null, 'にげあし', 'かるわざ', 'はりこみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('031', 'ジグザグマ', 38, 30, 41, 30, 41, 60, 'ノーマル', 'あく', 'ものひろい', 'くいしんぼう', 'はやあし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('032', 'マッスグマ', 78, 70, 61, 50, 61, 100, 'ノーマル', 'あく', 'ものひろい', 'くいしんぼう', 'はやあし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('033', 'タチフサグマ', 93, 90, 101, 60, 81, 95, 'ノーマル', 'あく', 'すてみ', 'こんじょう', 'まけんき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('034', 'ウールー', 42, 40, 55, 40, 45, 48, 'ノーマル', null, 'もふもふ', 'にげあし', 'ぼうだん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('035', 'バイウールー', 72, 80, 100, 60, 90, 88, 'ノーマル', null, 'もふもふ', 'ふくつのこころ', 'ぼうだん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('036', 'ハスボー', 40, 30, 30, 40, 50, 30, 'みず', 'くさ', 'すいすい', 'あめうけざら', 'マイペース')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('037', 'ハスブレロ', 60, 50, 50, 60, 70, 50, 'みず', 'くさ', 'すいすい', 'あめうけざら', 'マイペース')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('038', 'ルンパッパ', 80, 70, 70, 90, 100, 70, 'みず', 'くさ', 'すいすい', 'あめうけざら', 'マイペース')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('039', 'タネボー', 40, 40, 50, 30, 30, 30, 'くさ', null, 'ようりょくそ', 'はやおき', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('040', 'コノハナ', 70, 70, 40, 60, 40, 60, 'くさ', 'あく', 'ようりょくそ', 'はやおき', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('041', 'ダーテング', 90, 100, 60, 90, 60, 80, 'くさ', 'あく', 'ようりょくそ', 'はやおき', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('042', 'カムカメ', 50, 64, 50, 38, 38, 44, 'みず', null, 'がんじょうあご', 'シェルアーマー', 'すいすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('043', 'カジリガメ', 90, 115, 90, 48, 68, 74, 'みず', 'いわ', 'がんじょうあご', 'シェルアーマー', 'すいすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('044', 'チョロネコ', 41, 50, 37, 50, 37, 66, 'あく', null, 'じゅうなん', 'かるわざ', 'いたずらごころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('045', 'レパルダス', 64, 88, 50, 88, 50, 106, 'あく', null, 'じゅうなん', 'かるわざ', 'いたずらごころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('046', 'ワンパチ', 59, 45, 50, 40, 50, 26, 'でんき', null, 'たまひろい', null, 'びびり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('047', 'パルスワン', 69, 90, 60, 90, 60, 121, 'でんき', null, 'がんじょうあご', null, 'かちき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('048', 'ホルビー', 38, 36, 38, 32, 36, 57, 'ノーマル', null, 'ものひろい', 'ほおぶくろ', 'ちからもち')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('049', 'ホルード', 85, 56, 77, 50, 77, 78, 'ノーマル', 'じめん', 'ものひろい', 'ほおぶくろ', 'ちからもち')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('050', 'チラーミィ', 55, 50, 40, 40, 40, 75, 'ノーマル', null, 'メロメロボディ', 'テクニシャン', 'スキルリンク')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('051', 'チラチーノ', 75, 95, 60, 65, 60, 115, 'ノーマル', null, 'メロメロボディ', 'テクニシャン', 'スキルリンク')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('052', 'アマカジ', 42, 30, 38, 30, 38, 32, 'くさ', null, 'リーフガード', 'どんかん', 'スイートベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('053', 'アママイコ', 52, 40, 48, 40, 48, 62, 'くさ', null, 'リーフガード', 'どんかん', 'スイートベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('054', 'アマージョ', 72, 120, 98, 50, 98, 72, 'くさ', null, 'リーフガード', 'ジょうおうのいげん', 'スイートベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('055', 'ナゾノクサ', 45, 50, 55, 75, 65, 30, 'くさ', 'どく', 'ようりょくそ', null, 'にげあし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('056', 'クサイハナ', 60, 65, 70, 85, 75, 40, 'くさ', 'どく', 'ようりょくそ', null, 'あくしゅう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('057', 'ラフレシア', 75, 80, 85, 110, 90, 50, 'くさ', 'どく', 'ようりょくそ', null, 'ほうし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('058', 'キレイハナ', 75, 80, 95, 90, 100, 50, 'くさ', 'どく', 'ようりょくそ', null, 'いやしのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('059', 'スボミー', 40, 30, 35, 50, 70, 55, 'くさ', 'どく', 'しぜんかいふく', 'どくのトゲ', 'リーフガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('060', 'ロゼリア', 50, 60, 45, 100, 80, 65, 'くさ', 'どく', 'しぜんかいふく', 'どくのトゲ', 'リーフガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('061', 'ロズレイド', 60, 70, 65, 125, 105, 90, 'くさ', 'どく', 'しぜんかいふく', 'どくのトゲ', 'リーフガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('062', 'キャモメ', 40, 30, 30, 55, 30, 85, 'みず', 'ひこう', 'するどいめ', 'うるおいボディ', 'あめうけざら')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('063', 'ペリッパー', 60, 50, 100, 95, 70, 65, 'みず', 'ひこう', 'するどいめ', 'あめふらし', 'あめうけざら')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('064', 'バチュル', 50, 47, 50, 57, 50, 65, 'むし', 'でんき', 'ふくがん', 'きんちょうかん', 'むしのしらせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('065', 'デンジュラ', 70, 77, 60, 97, 60, 108, 'むし', 'でんき', 'ふくがん', 'きんちょうかん', 'むしのしらせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('066', 'ラクライ', 40, 45, 40, 65, 40, 65, 'でんき', null, 'せいでんき', 'ひらいしん', 'マイナス')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('067', 'ライボルト', 70, 75, 60, 105, 60, 105, 'でんき', null, 'せいでんき', 'ひらいしん', 'マイナス')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('068', 'ロコン', 38, 41, 40, 50, 65, 65, 'ほのお', null, 'もらいび', null, 'ひでり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('069', 'キュウコン', 73, 76, 75, 81, 100, 100, 'ほのお', null, 'もらいび', null, 'ひでり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('070', 'ガーディ', 55, 70, 45, 70, 50, 60, 'ほのお', null, 'いかく', 'もらいび', 'せいぎのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('071', 'ウインディ', 90, 110, 80, 100, 80, 95, 'ほのお', null, 'いかく', 'もらいび', 'せいぎのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('072', 'バニプッチ', 36, 50, 50, 65, 60, 44, 'こおり', null, 'アイスボディ', 'ゆきがくれ', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('073', 'バニリッチ', 51, 65, 65, 80, 75, 59, 'こおり', null, 'アイスボディ', 'ゆきがくれ', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('074', 'バイバニラ', 71, 95, 85, 110, 95, 79, 'こおり', null, 'アイスボディ', 'ゆきふらし', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('075', 'ウリムー', 50, 50, 40, 30, 30, 50, 'こおり', 'じめん', 'どんかん', 'ゆきがくれ', 'あついしぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('076', 'イノムー', 100, 100, 80, 60, 60, 50, 'こおり', 'じめん', 'どんかん', 'ゆきがくれ', 'あついしぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('077', 'マンムー', 110, 130, 80, 70, 60, 80, 'こおり', 'じめん', 'どんかん', 'ゆきがくれ', 'あついしぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('078', 'デリバード', 45, 55, 45, 65, 45, 75, 'こおり', 'ひこう', 'やるき', 'はりきり', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('079', 'ユキワラシ', 50, 50, 50, 50, 50, 50, 'こおり', null, 'せいしんりょく', 'アイスボディ', 'ムラっけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('080', 'オニゴーリ', 80, 80, 80, 80, 80, 80, 'こおり', null, 'せいしんりょく', 'アイスボディ', 'ムラっけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('081', 'ユキメノコ', 70, 80, 70, 80, 70, 110, 'こおり', 'ゴースト', 'ゆきがくれ', null, 'のろわれボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('082', 'ヤジロン', 40, 40, 55, 40, 70, 55, 'じめん', 'エスパー', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('083', 'ネンドール', 60, 70, 105, 70, 120, 75, 'じめん', 'エスパー', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('084', 'ドロバンコ', 70, 100, 70, 45, 55, 45, 'じめん', null, 'マイペース', 'じきゅうりょく', 'せいしんりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('085', 'バンバドロ', 100, 125, 100, 55, 85, 35, 'じめん', null, 'マイペース', 'じきゅうりょく', 'せいしんりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('086', 'イシズマイ', 50, 65, 85, 35, 35, 55, 'むし', 'いわ', 'がんじょう', 'シェルアーマー', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('087', 'イワパレス', 70, 105, 125, 65, 75, 45, 'むし', 'いわ', 'がんじょう', 'シェルアーマー', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('088', 'ゴビット', 59, 74, 50, 35, 50, 35, 'じめん', 'ゴースト', 'てつのこぶし', 'ぶきよう', 'ノーガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('089', 'ゴルーグ', 89, 124, 80, 55, 80, 55, 'じめん', 'ゴースト', 'てつのこぶし', 'ぶきよう', 'ノーガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('090', 'ムンナ', 76, 25, 45, 67, 55, 24, 'エスパー', null, 'よちむ', 'シンクロ', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('091', 'ムシャーナ', 116, 55, 85, 107, 95, 29, 'エスパー', null, 'よちむ', 'シンクロ', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('092', 'ネイティ', 40, 50, 45, 70, 45, 70, 'エスパー', 'ひこう', 'シンクロ', 'はやおき', 'マジックミラー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('093', 'ネイティオ', 65, 75, 70, 95, 70, 95, 'エスパー', 'ひこう', 'シンクロ', 'はやおき', 'マジックミラー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('094', 'ヌイコグマ', 70, 75, 50, 45, 50, 50, 'ノーマル', 'かくとう', 'もふもふ', 'ぶきよう', 'メロメロボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('095', 'キテルグマ', 120, 125, 80, 55, 60, 60, 'ノーマル', 'かくとう', 'もふもふ', 'ぶきよう', 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('096', 'ユキカブリ', 60, 62, 50, 62, 60, 40, 'くさ', 'こおり', 'ゆきふらし', null, 'ぼうおん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('097', 'ユキノオー', 90, 92, 75, 92, 85, 60, 'くさ', 'こおり', 'ゆきふらし', null, 'ぼうおん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('098', 'クラブ', 30, 105, 90, 25, 25, 50, 'みず', null, 'かいりきバサミ', 'シェルアーマー', 'ちからずく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('099', 'キングラー', 55, 130, 115, 50, 50, 75, 'みず', null, 'かいりきバサミ', 'シェルアーマー', 'ちからずく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('100', 'ウパー', 55, 45, 45, 25, 25, 15, 'みず', 'じめん', 'しめりけ', 'ちょすい', 'てんねん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('101', 'ヌオー', 95, 85, 85, 65, 65, 35, 'みず', 'じめん', 'しめりけ', 'ちょすい', 'てんねん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('102', 'ヘイガニ', 43, 80, 65, 50, 35, 35, 'みず', null, 'かいりきバサミ', 'シェルアーマー', 'てきおうりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('103', 'シザリガー', 63, 120, 85, 90, 55, 55, 'みず', 'あく', 'かいりきバサミ', 'シェルアーマー', 'てきおうりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('104', 'ツチニン', 31, 45, 90, 30, 30, 40, 'むし', 'じめん', 'ふくがん', null, 'にげあし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('105', 'テッカニン', 61, 90, 45, 50, 50, 160, 'むし', 'ひこう', 'かそく', null, 'すりぬけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('106', 'ヌケニン', 1, 90, 45, 30, 30, 40, 'むし', 'ゴースト', 'ふしぎなまもり', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('107', 'バルキー', 35, 35, 35, 35, 35, 35, 'かくとう', null, 'こんじょう', 'ふくつのこころ', 'やるき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('108', 'サワムラー', 50, 120, 53, 35, 110, 87, 'かくとう', null, 'じゅうなん', 'すてみ', 'かるわざ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('109', 'エビワラー', 50, 105, 79, 35, 110, 76, 'かくとう', null, 'するどいめ', 'てつのこぶし', 'せいしんりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('110', 'カポエラー', 50, 95, 95, 35, 110, 70, 'かくとう', null, 'いかく', 'テクニシャン', 'ふくつのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('111', 'ヤンチャム', 67, 82, 62, 46, 48, 43, 'かくとう', null, 'てつのこぶし', 'かたやぶり', 'きもったま')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('112', 'ゴロンダ', 95, 124, 78, 69, 71, 58, 'かくとう', 'あく', 'てつのこぶし', 'かたやぶり', 'きもったま')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('113', 'ギアル', 40, 55, 70, 45, 60, 30, 'はがね', null, 'プラス', 'マイナス', 'クリアボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('114', 'ギギアル', 60, 80, 95, 70, 85, 50, 'はがね', null, 'プラス', 'マイナス', 'クリアボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('115', 'ギギギアル', 60, 100, 115, 70, 85, 90, 'はがね', null, 'プラス', 'マイナス', 'クリアボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('116', 'ミツハニー', 30, 30, 42, 30, 42, 70, 'むし', 'ひこう', 'みつあつめ', null, 'はりきり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('117', 'ビークイン', 70, 80, 102, 80, 102, 40, 'むし', 'ひこう', 'プレッシャー', null, 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('118', 'ドーミラー', 57, 24, 86, 24, 86, 23, 'はがね', 'エスパー', 'ふゆう', 'たいねつ', 'ヘビィメタル')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('119', 'ドータクン', 67, 89, 116, 79, 116, 33, 'はがね', 'エスパー', 'ふゆう', 'たいねつ', 'ヘビィメタル')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('120', 'ラルトス', 28, 25, 25, 45, 35, 40, 'エスパー', 'フェアリー', 'シンクロ', 'トレース', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('121', 'キルリア', 38, 35, 35, 65, 55, 50, 'エスパー', 'フェアリー', 'シンクロ', 'トレース', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('122', 'サーナイト', 68, 65, 65, 125, 115, 80, 'エスパー', 'フェアリー', 'シンクロ', 'トレース', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('123', 'エルレイド', 68, 125, 65, 65, 115, 80, 'エスパー', 'かくとう', 'ふくつのこころ', null, 'せいぎのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('124', 'フワンテ', 90, 50, 34, 60, 44, 70, 'ゴースト', 'ひこう', 'ゆうばく', 'かるわざ', 'ねつぼうそう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('125', 'フワライド', 150, 80, 44, 90, 54, 80, 'ゴースト', 'ひこう', 'ゆうばく', 'かるわざ', 'ねつぼうそう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('126', 'ヒメンカ', 40, 40, 60, 40, 60, 10, 'くさ', null, 'わたげ', 'さいせいりょく', 'ほうし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('127', 'ワタシラガ', 60, 50, 90, 80, 120, 60, 'くさ', null, 'わたげ', 'さいせいりょく', 'ほうし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('128', 'チェリンボ', 45, 35, 45, 62, 53, 35, 'くさ', null, 'ようりょくそ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('129', 'チェリム', 70, 60, 70, 87, 78, 85, 'くさ', null, 'フラワーギフト', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('130', 'スカンプー', 63, 63, 47, 41, 41, 74, 'どく', 'あく', 'あくしゅう', 'ゆうばく', 'するどいめ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('131', 'スカタンク', 103, 93, 67, 71, 61, 84, 'どく', 'あく', 'あくしゅう', 'ゆうばく', 'するどいめ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('132', 'オタマロ', 50, 50, 40, 50, 40, 64, 'みず', null, 'すいすい', 'うるおいボディ', 'ちょすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('133', 'ガマガル', 75, 65, 55, 65, 55, 69, 'みず', 'じめん', 'すいすい', 'うるおいボディ', 'ちょすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('134', 'ガマゲロゲ', 105, 85, 75, 85, 75, 74, 'みず', 'じめん', 'すいすい', 'どくしゅ', 'ちょすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('135', 'ヨマワル', 20, 40, 90, 30, 90, 25, 'ゴースト', null, 'ふゆう', null, 'おみとおし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('136', 'サマヨール', 40, 70, 130, 60, 130, 25, 'ゴースト', null, 'プレッシャー', null, 'おみとおし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('137', 'ヨノワール', 45, 100, 135, 65, 135, 45, 'ゴースト', null, 'プレッシャー', null, 'おみとおし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('138', 'ワンリキー', 70, 80, 50, 35, 35, 35, 'かくとう', null, 'こんじょう', 'ノーガード', 'ふくつのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('139', 'ゴーリキー', 80, 100, 70, 50, 60, 45, 'かくとう', null, 'こんじょう', 'ノーガード', 'ふくつのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('140', 'カイリキー', 90, 130, 80, 65, 85, 55, 'かくとう', null, 'こんじょう', 'ノーガード', 'ふくつのこころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('141', 'ゴース', 30, 35, 30, 100, 35, 80, 'ゴースト', 'どく', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('142', 'ゴースト', 45, 50, 45, 115, 55, 95, 'ゴースト', 'どく', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('143', 'ゲンガー', 60, 65, 60, 130, 75, 110, 'ゴースト', 'どく', 'のろわれボディ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('144', 'コイキング', 20, 10, 55, 15, 20, 80, 'みず', null, 'すいすい', null, 'びびり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('145', 'ギャラドス', 95, 125, 79, 60, 100, 81, 'みず', 'ひこう', 'いかく', null, 'じしんかじょう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('146', 'トサキント', 45, 67, 60, 35, 50, 63, 'みず', null, 'すいすい', 'みずのベール', 'ひらいしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('147', 'アズマオウ', 80, 92, 65, 65, 80, 68, 'みず', null, 'すいすい', 'みずのベール', 'ひらいしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('148', 'テッポウオ', 35, 65, 35, 65, 35, 65, 'みず', null, 'はりきり', 'スナイパー', 'ムラっけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('149', 'オクタン', 75, 105, 75, 105, 75, 45, 'みず', null, 'きゅうばん', 'スナイパー', 'ムラっけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('150', 'シェルダー', 30, 65, 100, 45, 25, 40, 'みず', null, 'シェルアーマー', 'スキルリンク', 'ぼうじん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('151', 'パルシェン', 50, 95, 180, 85, 45, 70, 'みず', 'こおり', 'シェルアーマー', 'スキルリンク', 'ぼうじん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('152', 'ヒンバス', 20, 15, 20, 10, 55, 80, 'みず', null, 'すいすい', 'どんかん', 'てきおうりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('153', 'ミロカロス', 95, 60, 79, 100, 125, 81, 'みず', null, 'ふしぎなうろこ', 'かちき', 'メロメロボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('154-1', 'バスラオ(あかすじのすがた)', 70, 92, 65, 80, 55, 98, 'みず', null, 'すてみ', 'てきおうりょく', 'かたやぶり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('154-2', 'バスラオ(あおすじのすがた)', 70, 92, 65, 80, 55, 98, 'みず', null, 'いしあたま', 'てきおうりょく', 'かたやぶり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('155-1', 'ヨワシ(たんどくのすがた)', 45, 20, 20, 25, 25, 40, 'みず', null, 'ぎょぐん', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('155-2', 'ヨワシ(むれたすがた)', 45, 140, 130, 140, 135, 30, 'みず', null, 'ぎょぐん', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('156', 'ナマコブシ', 55, 60, 130, 30, 130, 5, 'みず', null, 'とびだすなかみ', null, 'てんねん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('157', 'ヤブクロン', 50, 50, 62, 40, 62, 65, 'どく', null, 'あくしゅう', 'ねんちゃく', 'ゆうばく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('158', 'ダストダス', 80, 95, 82, 60, 82, 75, 'どく', null, 'あくしゅう', 'くだけるよろい', 'ゆうばく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('159', 'ヤクデ', 50, 65, 45, 50, 50, 45, 'ほのお', 'むし', 'もらいび', 'しろいけむり', 'ほのおのからだ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('160', 'マルヤクデ', 100, 115, 65, 90, 90, 65, 'ほのお', 'むし', 'もらいび', 'しろいけむり', 'ほのおのからだ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('161', 'タンドン', 30, 40, 50, 40, 50, 30, 'いわ', null, 'じょうききかん', 'たいねつ', 'もらいび')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('162', 'トロッゴン', 80, 60, 90, 60, 70, 50, 'いわ', 'ほのお', 'じょうききかん', 'ほのおのからだ', 'もらいび')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('163', 'セキタンザン', 110, 80, 120, 80, 90, 30, 'いわ', 'ほのお', 'じょうききかん', 'ほのおのからだ', 'もらいび')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('164', 'ディグダ', 10, 55, 25, 35, 45, 95, 'じめん', null, 'すながくれ', 'ありじごく', 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('165', 'ダグトリオ', 35, 100, 50, 50, 70, 120, 'じめん', null, 'すながくれ', 'ありじごく', 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('166', 'モグリュー', 60, 85, 40, 30, 45, 68, 'じめん', null, 'すなかき', 'すなのちから', 'かたやぶり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('167', 'ドリュウズ', 110, 135, 60, 50, 65, 88, 'じめん', null, 'すなかき', 'すなのちから', 'かたやぶり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('168', 'ダンゴロ', 55, 75, 85, 25, 25, 15, 'いわ', null, 'がんじょう', 'くだけるよろい', 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('169', 'ガントル', 70, 105, 105, 50, 40, 20, 'いわ', null, 'がんじょう', 'くだけるよろい', 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('170', 'ギガイアス', 85, 135, 130, 60, 80, 25, 'いわ', null, 'がんじょう', 'すなおこし', 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('171', 'ドッコラー', 75, 80, 55, 25, 35, 35, 'かくとう', null, 'こんじょう', 'ちからずく', 'てつのこぶし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('172', 'ドテッコツ', 85, 105, 85, 40, 50, 40, 'かくとう', null, 'こんじょう', 'ちからずく', 'てつのこぶし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('173', 'ローブシン', 105, 140, 95, 55, 65, 45, 'かくとう', null, 'こんじょう', 'ちからずく', 'てつのこぶし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('174', 'ココモリ', 65, 45, 43, 55, 43, 72, 'エスパー', 'ひこう', 'てんねん', 'ぶきよう', 'たんじゅん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('175', 'ココロモリ', 67, 57, 55, 77, 55, 114, 'エスパー', 'ひこう', 'てんねん', 'ぶきよう', 'たんじゅん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('176', 'オンバット', 40, 30, 35, 45, 40, 55, 'ドラゴン', 'ひこう', 'おみとおし', 'すりぬけ', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('177', 'オンバーン', 85, 70, 80, 97, 80, 123, 'ドラゴン', 'ひこう', 'おみとおし', 'すりぬけ', 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('178', 'イワーク', 35, 45, 160, 30, 45, 70, 'いわ', 'じめん', 'いしあたま', 'がんじょう', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('179', 'ハガネール', 75, 85, 200, 55, 65, 30, 'はがね', 'じめん', 'いしあたま', 'がんじょう', 'ちからずく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('180', 'サカシマス', 41, 63, 40, 40, 30, 66, 'みず', null, 'すいすい', null, 'スクリューおびれ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('181', 'カマスジョー', 61, 123, 60, 60, 50, 136, 'みず', null, 'すいすい', null, 'スクリューおびれ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('182-1', 'ニャース', 40, 45, 35, 40, 40, 90, 'ノーマル', null, 'ものひろい', 'テクニシャン', 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('182-2', 'ニャース(ガラルのすがた)', 50, 65, 55, 40, 40, 40, 'はがね', null, 'ものひろい', 'かたいツメ', 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('183', 'ニャイキング', 70, 110, 100, 50, 60, 50, 'はがね', null, 'カブトアーマー', 'かたいツメ', 'はがねのせいしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('184', 'ペルシアン', 65, 70, 60, 65, 65, 115, 'ノーマル', null, 'じゅうなん', 'テクニシャン', 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('185', 'マホミル', 45, 40, 40, 50, 61, 34, 'フェアリー', null, 'スイートベール', null, 'アロマベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('186', 'マホイップ', 65, 60, 75, 110, 121, 64, 'フェアリー', null, 'スイートベール', null, 'アロマベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('187', 'アブリー', 40, 45, 40, 55, 40, 84, 'むし', 'フェアリー', 'みつあつめ', 'りんぷん', 'スイートベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('188', 'アブリボン', 60, 55, 60, 95, 70, 124, 'むし', 'フェアリー', 'みつあつめ', 'りんぷん', 'スイートベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('189', 'テッシード', 44, 50, 91, 24, 86, 10, 'くさ', 'はがね', 'てつのトゲ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('190', 'ナットレイ', 74, 94, 131, 54, 116, 20, 'くさ', 'はがね', 'てつのトゲ', null, 'きけんよち')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('191-1', 'バケッチャ(ちいさいサイズ)', 44, 66, 70, 44, 55, 56, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('191-2', 'バケッチャ(ふつうのサイズ)', 49, 66, 70, 44, 55, 51, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('191-3', 'バケッチャ(おおきいサイズ)', 54, 66, 70, 44, 55, 46, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('191-4', 'バケッチャ(とくだいサイズ)', 59, 66, 70, 44, 55, 41, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('192-1', 'パンプジン(ちいさいサイズ)', 55, 85, 122, 58, 75, 99, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('192-2', 'パンプジン(ふつうのサイズ)', 65, 90, 122, 58, 75, 85, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('192-3', 'パンプジン(おおきいサイズ)', 75, 95, 122, 58, 75, 69, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('192-4', 'パンプジン(とくだいサイズ)', 85, 100, 122, 58, 75, 54, 'ゴースト', 'くさ', 'ものひろい', 'おみとおし', 'ふみん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('193', 'ピチュー', 20, 40, 15, 35, 35, 60, 'でんき', null, 'せいでんき', null, 'ひらいしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('194', 'ピカチュウ', 35, 55, 40, 50, 50, 90, 'でんき', null, 'せいでんき', null, 'ひらいしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('195', 'ライチュウ', 60, 90, 55, 90, 80, 110, 'でんき', null, 'せいでんき', null, 'ひらいしん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('196', 'イーブイ', 55, 55, 50, 45, 65, 55, 'ノーマル', null, 'にげあし', 'てきおうりょく', 'きけんよち')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('197', 'シャワーズ', 130, 65, 60, 110, 95, 65, 'みず', null, 'ちょすい', null, 'うるおいボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('198', 'サンダース', 65, 65, 60, 110, 95, 130, 'でんき', null, 'ちくでん', null, 'はやあし')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('199', 'ブースター', 65, 130, 60, 95, 110, 65, 'ほのお', null, 'もらいび', null, 'こんじょう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('200', 'エーフィ', 65, 65, 50, 130, 95, 110, 'エスパー', null, 'シンクロ', null, 'マジックミラー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('201', 'ブラッキー', 95, 65, 110, 60, 130, 65, 'あく', null, 'シンクロ', null, 'せいしんりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('202', 'リーフィア', 65, 110, 130, 60, 65, 95, 'くさ', null, 'リーフガード', null, 'ようりょくそ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('203', 'グレイシア', 65, 60, 110, 130, 95, 65, 'こおり', null, 'ゆきがくれ', null, 'アイスボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('204', 'ニンフィア', 95, 65, 65, 110, 130, 60, 'フェアリー', null, 'メロメロボディ', null, 'フェアリースキン')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('205', 'カジッチュ', 40, 40, 80, 40, 40, 20, 'くさ', 'ドラゴン', 'じゅくせい', 'くいしんぼう', 'ぼうだん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('206', 'アップリュー', 70, 110, 80, 95, 60, 70, 'くさ', 'ドラゴン', 'じゅくせい', 'くいしんぼう', 'はりきり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('207', 'タルップル', 110, 85, 80, 100, 80, 30, 'くさ', 'ドラゴン', 'じゅくせい', 'くいしんぼう', 'あついしぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('208', 'ニャスパー', 62, 48, 54, 63, 60, 68, 'エスパー', null, 'するどいめ', 'すりぬけ', 'マイペース')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('209', 'ニャオニクス', 74, 48, 76, 83, 81, 104, 'エスパー', null, 'するどいめ', 'すりぬけ', 'いたずらごころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('210', 'ペロッパフ', 62, 48, 66, 59, 57, 49, 'フェアリー', null, 'スイートベール', null, 'かるわざ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('211', 'ペロリーム', 82, 80, 86, 85, 75, 72, 'フェアリー', null, 'スイートベール', null, 'かるわざ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('212', 'シュシュプ', 78, 52, 60, 63, 65, 23, 'フェアリー', null, 'いやしのこころ', null, 'アロマベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('213', 'フレフワン', 101, 72, 72, 99, 89, 29, 'フェアリー', null, 'いやしのこころ', null, 'アロマベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('214', 'シズクモ', 38, 40, 52, 40, 72, 27, 'みず', 'むし', 'すいほう', null, 'ちょすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('215', 'オニシズクモ', 68, 70, 92, 50, 132, 42, 'みず', 'むし', 'すいほう', null, 'ちょすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('216', 'ソーナノ', 95, 23, 48, 23, 48, 23, 'エスパー', null, 'かげふみ', null, 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('217', 'ソーナンス', 190, 33, 58, 33, 58, 33, 'エスパー', null, 'かげふみ', null, 'テレパシー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('218', 'カモネギ', 52, 95, 55, 58, 62, 55, 'かくとう', null, 'ふくつのこころ', null, 'きもったま')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('219', 'ネギガナイト', 62, 135, 95, 68, 82, 65, 'かくとう', null, 'ふくつのこころ', null, 'きもったま')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('220', 'チョンチー', 75, 38, 38, 56, 56, 67, 'みず', 'でんき', 'ちくでん', 'はっこう', 'ちょすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('221', 'ランターン', 125, 58, 58, 76, 76, 67, 'みず', 'でんき', 'ちくでん', 'はっこう', 'ちょすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('222', 'グレッグル', 48, 61, 40, 61, 40, 50, 'どく', 'かくとう', 'きけんよち', 'かんそうはだ', 'どくしゅ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('223', 'ドグロッグ', 83, 106, 65, 86, 65, 85, 'どく', 'かくとう', 'きけんよち', 'かんそうはだ', 'どくしゅ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('224', 'ズルッグ', 50, 75, 70, 36, 70, 48, 'あく', 'かくとう', 'だっぴ', 'じしんかじょう', 'いかく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('225', 'ズルズキン', 65, 90, 115, 45, 115, 58, 'あく', 'かくとう', 'だっぴ', 'じしんかじょう', 'いかく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('226', 'マッギョ', 109, 81, 99, 66, 84, 32, 'じめん', 'はがね', 'ぎたい', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('227', 'ツボツボ', 20, 10, 230, 10, 230, 5, 'むし', 'いわ', 'がんじょう', 'くいしんぼう', 'あまのじゃく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('228', 'ドジョッチ', 50, 48, 43, 46, 41, 60, 'みず', 'じめん', 'どんかん', 'きけんよち', 'うるおいボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('229', 'ナマズン', 110, 78, 73, 76, 71, 60, 'みず', 'じめん', 'どんかん', 'きけんよち', 'うるおいボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('230', 'カラナクシ', 76, 48, 48, 57, 62, 34, 'みず', null, 'ねんちゃく', 'よびみず', 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('231', 'トリトドン', 111, 83, 68, 92, 82, 39, 'みず', 'じめん', 'ねんちゃく', 'よびみず', 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('232', 'コソクムシ', 25, 35, 40, 20, 30, 80, 'むし', 'みず', 'にげごし', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('233', 'グソクムシャ', 75, 125, 140, 60, 90, 40, 'むし', 'みず', 'ききかいひ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('234', 'カメテテ', 42, 52, 67, 39, 56, 50, 'いわ', 'みず', 'かたいツメ', 'スナイパー', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('235', 'ガメノデス', 72, 105, 115, 54, 86, 68, 'いわ', 'みず', 'かたいツメ', 'スナイパー', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('236', 'サニーゴ', 60, 55, 100, 65, 100, 30, 'ゴースト', null, 'くだけるよろい', null, 'のろわれボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('237', 'サニゴーン', 60, 95, 50, 145, 130, 30, 'ゴースト', null, 'くだけるよろい', null, 'ほろびのボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('238', 'ベロバー', 45, 45, 30, 55, 40, 50, 'あく', 'フェアリー', 'いたすらごころ', 'おみとおし', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('239', 'ギモー', 65, 60, 45, 75, 55, 70, 'あく', 'フェアリー', 'いたすらごころ', 'おみとおし', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('240', 'オーロンゲ', 95, 120, 65, 95, 75, 60, 'あく', 'フェアリー', 'いたすらごころ', 'おみとおし', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('241', 'ミブリム', 42, 30, 45, 56, 53, 39, 'エスパー', null, 'いやしのこころ', 'きけんよち', 'マジックミラー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('242', 'テブリム', 57, 40, 65, 86, 73, 49, 'エスパー', null, 'いやしのこころ', 'きけんよち', 'マジックミラー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('243', 'ブリムオン', 57, 90, 95, 136, 103, 29, 'エスパー', 'フェアリー', 'いやしのこころ', 'きけんよち', 'マジックミラー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('244', 'ヤトウモリ', 48, 44, 40, 71, 40, 77, 'どく', 'ほのお', 'ふしょく', null, 'どんかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('245', 'エンニュート', 68, 64, 60, 111, 60, 117, 'どく', 'ほのお', 'ふしょく', null, 'どんかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('246', 'コマタナ', 45, 85, 70, 40, 40, 60, 'あく', 'はがね', 'まけんき', 'せいしんりょく', 'プレッシャー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('247', 'キリキザン', 65, 125, 100, 60, 70, 70, 'あく', 'はがね', 'まけんき', 'せいしんりょく', 'プレッシャー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('248', 'ナゲキ', 120, 100, 85, 30, 85, 45, 'かくとう', null, 'こんじょう', 'せいしんりょく', 'かたやぶり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('249', 'ダゲキ', 75, 125, 75, 30, 75, 85, 'かくとう', null, 'がんじょう', 'せいしんりょく', 'かたやぶり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('250', 'ドガース', 40, 65, 95, 60, 45, 35, 'どく', null, 'ふゆう', 'かがくへんかガス', 'あくしゅう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('251', 'マタドガス', 65, 90, 120, 85, 70, 60, 'どく', 'フェアリー', 'ふゆう', 'かがくへんかガス', 'ミストメイカー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('252', 'ウソハチ', 50, 80, 95, 10, 45, 10, 'いわ', null, 'がんじょう', 'いしあたま', null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('253', 'ウソッキー', 70, 100, 115, 30, 65, 30, 'いわ', null, 'がんじょう', 'いしあたま', 'びびり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('254', 'ピィ', 50, 25, 28, 45, 55, 15, 'フェアリー', null, 'メロメロボディ', 'マジックガード', 'フレンドガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('255', 'ピッピ', 70, 45, 48, 60, 65, 35, 'フェアリー', null, 'メロメロボディ', 'マジックガード', 'フレンドガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('256', 'ピクシー', 95, 70, 73, 95, 90, 60, 'フェアリー', null, 'メロメロボディ', 'マジックガード', 'てんねん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('257', 'トゲピー', 35, 20, 65, 40, 65, 20, 'フェアリー', null, 'はりきり', 'てんのめぐみ', 'きょううん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('258', 'トゲチック', 55, 40, 85, 80, 105, 40, 'フェアリー', 'ひこう', 'はりきり', 'てんのめぐみ', 'きょううん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('259', 'トゲキッス', 85, 50, 95, 120, 115, 80, 'フェアリー', 'ひこう', 'はりきり', 'てんのめぐみ', 'きょううん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('260', 'ゴンべ', 125, 85, 40, 40, 85, 5, 'ノーマル', null, 'ものひろい', 'あついしぼう', 'くいしんぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('261', 'カビゴン', 160, 110, 65, 65, 110, 30, 'ノーマル', null, 'めんえき', 'あついしぼう', 'くいしんぼう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('262', 'モンメン', 40, 27, 60, 37, 50, 66, 'くさ', 'フェアリー', 'いたすらごころ', 'すりぬけ', 'ようりょくそ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('263', 'エルフーン', 60, 67, 85, 77, 75, 116, 'くさ', 'フェアリー', 'いたすらごころ', 'すりぬけ', 'ようりょくそ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('264', 'サイホーン', 80, 85, 95, 30, 30, 25, 'じめん', 'いわ', 'ひらいしん', 'いしあたま', 'すてみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('265', 'サイドン', 105, 130, 120, 45, 45, 40, 'じめん', 'いわ', 'ひらいしん', 'いしあたま', 'すてみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('266', 'ドサイドン', 115, 140, 130, 55, 55, 40, 'じめん', 'いわ', 'ひらいしん', 'ハードロック', 'すてみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('267', 'ゴチム', 45, 30, 50, 55, 65, 45, 'エスパー', null, 'おみとおし', 'かちき', 'かげふみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('268', 'ゴチミル', 60, 45, 70, 75, 85, 55, 'エスパー', null, 'おみとおし', 'かちき', 'かげふみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('269', 'ゴチルゼル', 70, 55, 95, 95, 110, 65, 'エスパー', null, 'おみとおし', 'かちき', 'かげふみ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('270', 'ユニラン', 45, 30, 40, 105, 50, 20, 'エスパー', null, 'ぼうじん', 'マジックガード', 'さいせいりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('271', 'タブラン', 65, 40, 50, 125, 60, 30, 'エスパー', null, 'ぼうじん', 'マジックガード', 'さいせいりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('272', 'ランクルス', 110, 65, 75, 125, 85, 30, 'エスパー', null, 'ぼうじん', 'マジックガード', 'さいせいりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('273', 'カブルモ', 50, 75, 45, 40, 45, 60, 'むし', null, 'むしのしらせ', 'だっぴ', 'ノーガード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('274', 'シュバルゴ', 70, 135, 105, 60, 105, 20, 'むし', 'はがね', 'むしのしらせ', 'シェルアーマー', 'ぼうじん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('275', 'チョボマキ', 50, 40, 85, 40, 65, 25, 'むし', null, 'うるおいボディ', 'シェルアーマー', 'ぼうじん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('276', 'アギルダー', 80, 70, 40, 110, 60, 145, 'むし', null, 'うるおいボディ', 'ねんちゃく', 'かるわざ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('277', 'リグレー', 55, 55, 55, 85, 55, 30, 'エスパー', null, 'テレパシー', 'シンクロ', 'アナライズ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('278', 'オーベム', 75, 75, 75, 125, 95, 40, 'エスパー', null, 'テレパシー', 'シンクロ', 'アナライズ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('279', 'クマシュン', 55, 70, 40, 60, 40, 40, 'こおり', null, 'ゆきがくれ', 'ゆきかき', 'びびり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('280', 'ツンベアー', 95, 110, 80, 70, 80, 50, 'こおり', null, 'ゆきがくれ', 'ゆきかき', 'すいすい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('281', 'ワシボン', 70, 83, 50, 37, 50, 60, 'ノーマル', 'ひこう', 'するどいめ', 'ちからずく', 'はりきり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('282', 'ウォーグル', 100, 123, 75, 57, 75, 80, 'ノーマル', 'ひこう', 'するどいめ', 'ちからずく', 'まけんき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('283', 'バルチャイ', 70, 55, 75, 45, 65, 60, 'あく', 'ひこう', 'はとむね', 'ぼうじん', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('284', 'バルジーナ', 110, 65, 105, 55, 95, 80, 'あく', 'ひこう', 'はとむね', 'ぼうじん', 'くだけるよろい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('285', 'スコルピ', 40, 50, 90, 30, 55, 65, 'どく', 'むし', 'カブトアーマー', 'スナイパー', 'するどいめ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('286', 'ドラピオン', 70, 90, 110, 60, 75, 95, 'どく', 'あく', 'カブトアーマー', 'スナイパー', 'するどいめ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('287', 'ヒトモシ', 50, 30, 55, 65, 55, 20, 'ゴースト', 'ほのお', 'もらいび', 'ほのおのからだ', 'すりぬけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('288', 'ランプラー', 60, 40, 60, 95, 60, 55, 'ゴースト', 'ほのお', 'もらいび', 'ほのおのからだ', 'すりぬけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('289', 'シャンデラ', 60, 55, 90, 145, 90, 80, 'ゴースト', 'ほのお', 'もらいび', 'ほのおのからだ', 'すりぬけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('290', 'マーイーカ', 53, 54, 53, 37, 46, 45, 'あく', 'エスパー', 'あまのじゃく', 'きゅうばん', 'すりぬけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('291', 'カラマネロ', 86, 92, 88, 68, 75, 73, 'あく', 'エスパー', 'あまのじゃく', 'きゅうばん', 'すりぬけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('292', 'ニューラ', 55, 95, 55, 35, 75, 115, 'あく', 'こおり', 'せいしんりょく', 'するどいめ', 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('293', 'マニューラ', 70, 120, 65, 45, 85, 125, 'あく', 'こおり', 'プレッシャー', null, 'わるいてぐせ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('294', 'ヤミラミ', 50, 75, 75, 65, 65, 50, 'あく', 'ゴースト', 'するどいめ', 'あとだし', 'いたすらごころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('295', 'クチート', 50, 85, 85, 55, 55, 50, 'はがね', 'フェアリー', 'かいりきバサミ', 'いかく', 'ちからずく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('296', 'マラカッチ', 75, 86, 67, 106, 67, 60, 'くさ', null, 'ちょすい', 'ようりょくそ', 'よびみず')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('297', 'シンボラー', 72, 58, 80, 103, 80, 97, 'エスパー', 'ひこう', 'ミラクルスキン', 'マジックガード', 'いろめがね')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('298', 'リオル', 40, 70, 40, 35, 40, 60, 'かくとう', null, 'ふくつのこころ', 'せいしんりょく', 'いたずらごころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('299', 'ルカリオ', 70, 110, 70, 115, 70, 90, 'かくとう', 'はがね', 'ふくつのこころ', 'せいしんりょく', 'いたずらごころ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('300', 'コータス', 70, 85, 140, 85, 70, 20, 'ほのお', null, 'しろいけむり', 'ひでり', 'シェルアーマー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('301', 'ミミッキュ', 55, 90, 80, 50, 105, 96, 'ゴースト', 'フェアリー', 'ばけのかわ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('302', 'ゾウドウ', 72, 80, 49, 40, 49, 40, 'はがね', null, 'ちからずく', null, 'ヘビィメタル')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('303', 'ダイオウドウ', 122, 130, 69, 80, 69, 30, 'はがね', null, 'ちからずく', null, 'ヘビィメタル')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('304', 'ハリーセン', 65, 95, 85, 55, 55, 85, 'みず', 'どく', 'どくのとげ', 'すいすい', 'いかく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('305', 'プルリル', 55, 40, 50, 65, 85, 40, 'みず', 'ゴースト', 'ちょすい', 'のろわれボディ', 'しめりけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('306', 'ブルンゲル', 100, 60, 70, 85, 105, 60, 'みず', 'ゴースト', 'ちょすい', 'のろわれボディ', 'しめりけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('307', 'ヒドイデ', 50, 53, 62, 43, 52, 45, 'どく', 'みず', 'ひとでなし', 'じゅうなん', 'さいせいりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('308', 'ドヒドイデ', 50, 63, 152, 53, 142, 35, 'どく', 'みず', 'ひとでなし', 'じゅうなん', 'さいせいりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('309', 'ウッウ', 70, 85, 55, 85, 95, 85, 'みず', 'ひこう', 'うのミサイル', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('310', 'エレズン', 40, 38, 35, 54, 35, 40, 'でんき', 'どく', 'びびり', 'せいでんき', 'ぶきよう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('311-1', 'ストリンダ―(ハイなすがた)', 75, 98, 70, 114, 70, 75, 'でんき', 'どく', 'パンクロック', 'プラス', 'テクニシャン')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('311-2', 'ストリンダ―(ローなすがた)', 75, 98, 70, 114, 70, 75, 'でんき', 'どく', 'パンクロック', 'マイナス', 'テクニシャン')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('312', 'スナヘビ', 52, 57, 75, 35, 50, 46, 'じめん', null, 'すなはき', 'だっぴ', 'すながくれ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('313', 'サダイジャ', 72, 107, 125, 65, 70, 71, 'じめん', null, 'すなはき', 'だっぴ', 'すながくれ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('314', 'ヒポポタス', 68, 72, 78, 38, 42, 32, 'じめん', null, 'すなおこし', null, 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('315', 'カバルドン', 108, 112, 118, 68, 72, 47, 'じめん', null, 'すなおこし', null, 'すなのちから')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('316', 'アイアント', 58, 109, 112, 48, 48, 109, 'むし', 'はがね', 'むしのしらせ', 'はりきり', 'なまけ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('317', 'クイタラン', 85, 97, 66, 105, 66, 65, 'ほのお', null, 'くいしんぼう', 'もらいび', 'しろいけむり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('318', 'エリキテル', 44, 38, 33, 61, 43, 70, 'でんき', 'ノーマル', 'かんそうはだ', 'すながくれ', 'サンパワー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('319', 'エレザード', 62, 55, 52, 109, 94, 109, 'でんき', 'ノーマル', 'かんそうはだ', 'すながくれ', 'サンパワー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('320', 'ルチャブル', 78, 92, 75, 74, 63, 118, 'かくとう', 'ひこう', 'じゅうなん', 'かるわざ', 'かたやぶり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('321', 'ナックラー', 45, 100, 45, 45, 45, 10, 'じめん', null, 'かいりきバサミ', 'ありじごく', 'ちからずく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('322', 'ビブラーバ', 50, 70, 50, 50, 50, 70, 'ドラゴン', 'じめん', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('323', 'フライゴン', 80, 100, 80, 80, 80, 100, 'ドラゴン', 'じめん', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('324', 'キバゴ', 48, 87, 60, 30, 40, 57, 'ドラゴン', null, 'とうそうしん', 'かたやぶり', 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('325', 'オノンド', 66, 117, 70, 40, 50, 67, 'ドラゴン', null, 'とうそうしん', 'かたやぶり', 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('326', 'オノノクス', 76, 147, 90, 60, 70, 97, 'ドラゴン', null, 'とうそうしん', 'かたやぶり', 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('327-1', 'デスマス', 38, 30, 85, 55, 65, 30, 'ゴースト', null, 'ミイラ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('327-2', 'デスマス(ガラルのすがた)', 38, 55, 85, 30, 65, 30, 'じめん', 'ゴースト', 'さまようたましい', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('328', 'デスバーン', 58, 95, 145, 50, 105, 30, 'じめん', 'ゴースト', 'さまようたましい', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('329', 'デスカーン', 58, 50, 145, 95, 105, 30, 'ゴースト', null, 'ミイラ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('330', 'ヒトツキ', 45, 80, 100, 35, 37, 28, 'はがね', 'ゴースト', 'ノーガード', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('331', 'ニダンギル', 59, 110, 150, 45, 49, 35, 'はがね', 'ゴースト', 'ノーガード', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('332-1', 'ギルガルド(シールドフォルム)', 60, 50, 140, 50, 140, 60, 'はがね', 'ゴースト', 'バトルスイッチ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('332-2', 'ギルガルド(ブレードフォルム)', 60, 140, 50, 140, 50, 60, 'はがね', 'ゴースト', 'バトルスイッチ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('333-1', 'ポニータ', 50, 85, 55, 65, 65, 90, 'ほのお', null, 'にげあし', 'もらいび', 'ほのおのからだ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('333-2', 'ポニータ(ガラルのすがた)', 50, 85, 55, 65, 65, 90, 'エスパー', null, 'にげあし', 'パステルベール', 'きけんよち')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('334-1', 'ギャロップ', 65, 100, 70, 80, 80, 105, 'ほのお', null, 'にげあし', 'もらいび', 'ほのおのからだ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('334-2', 'ギャロップ(ガラルのすがた)', 65, 100, 70, 80, 80, 105, 'エスパー', 'フェアリー', 'にげあし', 'パステルベール', 'きけんよち')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('335', 'ヤバチャ', 40, 45, 45, 74, 54, 50, 'ゴースト', null, 'くだけるよろい', null, 'のろわれボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('336', 'ポットデス', 60, 65, 65, 134, 114, 70, 'ゴースト', null, 'くだけるよろい', null, 'のろわれボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('337-1', 'イエッサン(オスのすがた)', 60, 65, 55, 105, 95, 95, 'エスパー', 'ノーマル', 'せいしんりょく', 'シンクロ', 'サイコメーカー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('337-2', 'イエッサン(メスのすがた)', 70, 55, 65, 95, 105, 85, 'エスパー', 'ノーマル', 'マイペース', 'シンクロ', 'サイコメーカー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('338', 'ボクレー', 43, 70, 48, 50, 60, 38, 'ゴースト', 'くさ', 'しぜんかいふく', 'おみとおし', 'しゅうかく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('339', 'オーロット', 85, 110, 76, 65, 82, 56, 'ゴースト', 'くさ', 'しぜんかいふく', 'おみとおし', 'しゅうかく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('340', 'ネマシュ', 40, 35, 55, 65, 75, 15, 'くさ', 'フェアリー', 'はっこう', 'ほうし', 'あめうけざら')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('341', 'マシェード', 60, 45, 80, 90, 100, 30, 'くさ', 'フェアリー', 'はっこう', 'ほうし', 'あめうけざら')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('342', 'ヤレユータン', 90, 60, 80, 90, 110, 60, 'ノーマル', 'エスパー', 'せいしんりょく', 'テレパシー', 'きょうせい')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('343', 'ナゲツケサル', 100, 120, 90, 40, 60, 80, 'かくとう', null, 'レシーバー', null, 'まけんき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('344', 'モルペコ', 58, 95, 58, 70, 58, 97, 'でんき', 'あく', 'はらぺこスイッチ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('345', 'タイレーツ', 65, 100, 100, 70, 60, 75, 'かくとう', null, 'カブトアーマー', null, 'まけんき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('346', 'ジジーロン', 78, 60, 85, 135, 91, 36, 'ノーマル', 'ドラゴン', 'ぎゃくじょう', 'そうしょく', 'ノーてんき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('347', 'バグガメス', 60, 78, 135, 91, 85, 36, 'ほのお', 'ドラゴン', 'シェルアーマー', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('348', 'トゲデマル', 65, 98, 63, 40, 73, 96, 'でんき', 'はがね', 'てつのトゲ', 'ひらいしん', 'がんじょう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('349', 'ユキハミ', 30, 25, 34, 45, 30, 20, 'こおり', 'むし', 'りんぷん', null, 'こおりのりんぷん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('350', 'モスノウ', 70, 65, 60, 125, 90, 65, 'こおり', 'むし', 'りんぷん', null, 'こおりのりんぷん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('351', 'タタッコ', 50, 68, 60, 50, 50, 32, 'かくとう', null, 'じゅうなん', null, 'テクニシャン')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('352', 'オトスパス', 80, 118, 90, 70, 80, 42, 'かくとう', null, 'じゅうなん', null, 'テクニシャン')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('353', 'バチンウニ', 48, 101, 95, 91, 85, 15, 'でんき', null, 'ひらいしん', null, 'エレキメイカー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('354', 'タマンタ', 45, 20, 50, 60, 120, 50, 'みず', 'ひこう', 'すいすい', 'ちょすい', 'みずのベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('355', 'マンタイン', 65, 40, 70, 80, 140, 70, 'みず', 'ひこう', 'すいすい', 'ちょすい', 'みずのベール')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('356', 'ホエルコ', 130, 70, 35, 70, 35, 60, 'みず', null, 'みずのベール', 'どんかん', 'プレッシャー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('357', 'ホエルオー', 170, 90, 45, 90, 45, 60, 'みず', null, 'みずのベール', 'どんかん', 'プレッシャー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('358', 'カチコール', 55, 69, 85, 32, 35, 28, 'こおり', null, 'マイペース', 'アイスボディ', 'がんじょう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('359', 'クレベース', 95, 117, 184, 44, 46, 28, 'こおり', null, 'マイペース', 'アイスボディ', 'がんじょう')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('360', 'ダダリン', 70, 131, 100, 86, 90, 40, 'ゴースト', 'くさ', 'はがねつかい', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('361', 'ラプラス', 130, 85, 80, 85, 95, 60, 'みず', 'こおり', 'ちょすい', 'シェルアーマー', 'うるおいボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('362', 'ルナトーン', 90, 55, 65, 95, 85, 70, 'いわ', 'エスパー', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('363', 'ソルロック', 90, 95, 85, 55, 65, 70, 'いわ', 'エスパー', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('364', 'マネネ', 20, 25, 45, 70, 90, 60, 'エスパー', 'フェアリー', 'ぼうおん', 'フィルター', 'テクニシャン')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('365-1', 'バリヤード', 40, 45, 65, 10, 120, 90, 'エスパー', 'フェアリー', 'ぼうおん', 'フィルター', 'テクニシャン')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('365-2', 'バリヤード(ガラルのすがた)', 50, 65, 65, 90, 90, 100, 'こおり', 'エスパー', 'やるき', 'バリアフリー', 'アイスボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('366', 'バリコオル', 80, 85, 75, 110, 100, 70, 'こおり', 'エスパー', 'ちどりあし', 'バリアフリー', 'アイスボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('367-1', 'ダルマッカ', 70, 90, 45, 15, 45, 50, 'ほのお', null, 'はりきり', null, 'せいしんりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('367-2', 'ダルマッカ(ガラルのすがた)', 70, 90, 45, 15, 45, 50, 'こおり', null, 'はりきり', null, 'せいしんりょく')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('368-1', 'ヒヒダルマ', 105, 140, 55, 30, 55, 95, 'ほのお', null, 'ちからずく', null, 'ダルマモード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('368-2', 'ヒヒダルマ(ダルマモード)', 105, 30, 105, 140, 105, 55, 'ほのお', 'エスパー', 'ちからずく', null, 'ダルマモード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('368-3', 'ヒヒダルマ(ガラルのすがた)', 105, 140, 55, 30, 55, 95, 'こおり', null, 'ごりむちゅう', null, 'ダルマモード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('368-4', 'ヒヒダルマ(ガラルのすがた・ダルマモード)', 105, 160, 55, 30, 55, 135, 'こおり', 'ほのお', 'ちからずく', null, 'ダルマモード')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('369', 'イシヘンジン', 100, 125, 125, 20, 20, 70, 'いわ', null, 'パワースポット', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('370-1', 'コオリッポ(アイスフェイス)', 75, 80, 110, 65, 90, 50, 'こおり', null, 'アイスフェイス', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('370-2', 'コオリッポ(ナイスフェイス)', 75, 80, 70, 65, 50, 130, 'こおり', null, 'アイスフェイス', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('371', 'ジュラルドン', 70, 95, 115, 120, 50, 85, 'はがね', 'ドラゴン', 'ライトメタル', 'ヘビィメタル', 'すじがねいり')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('372-1', 'ロトム', 50, 50, 77, 95, 77, 91, 'でんき', 'ゴースト', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('372-2', 'ロトム(ヒートロトム)', 50, 65, 107, 105, 107, 86, 'でんき', 'ほのお', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('372-3', 'ロトム(ウォッシュロトム)', 50, 65, 107, 105, 107, 86, 'でんき', 'みず', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('372-4', 'ロトム(フロストロトム)', 50, 65, 107, 105, 107, 86, 'でんき', 'こおり', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('372-5', 'ロトム(スピンロトム)', 50, 65, 107, 105, 107, 86, 'でんき', 'ひこう', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('372-6', 'ロトム(カットロトム)', 50, 65, 107, 105, 107, 86, 'でんき', 'くさ', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('373', 'メタモン', 48, 48, 48, 48, 48, 48, 'ノーマル', null, 'じゅうなん', null, 'かわりもの')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('374', 'パッチラゴン', 90, 100, 90, 80, 70, 75, 'でんき', 'ドラゴン', 'ちくでん', 'はりきり', 'すなかき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('375', 'パッチルドン', 90, 100, 90, 90, 80, 55, 'でんき', 'こおり', 'ちくでん', 'せいでんき', 'ゆきかき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('376', 'ウオノラゴン', 90, 90, 100, 70, 80, 75, 'みず', 'ドラゴン', 'ちょすい', 'がんじょうあご', 'すなかき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('377', 'ウオチルドン', 90, 90, 100, 80, 90, 55, 'みず', 'こおり', 'ちょすい', 'アイスボディ', 'ゆきかき')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('378', 'ヒトカゲ', 39, 52, 43, 60, 50, 65, 'ほのお', null, 'もうか', null, 'サンパワー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('379', 'リザード', 58, 64, 58, 80, 65, 80, 'ほのお', null, 'もうか', null, 'サンパワー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('380', 'リザードン', 78, 84, 78, 109, 85, 100, 'ほのお', 'ひこう', 'もうか', null, 'サンパワー')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('381', 'タイプヌル', 95, 95, 95, 95, 95, 59, 'ノーマル', null, 'カブトアーマー', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('382', 'シルヴァディ', 95, 95, 95, 95, 95, 95, 'ノーマル', null, 'ARシステム', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('383', 'ヨーギラス', 50, 64, 50, 45, 50, 41, 'いわ', 'じめん', 'こんじょう', null, 'すながくれ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('384', 'サナギラス', 70, 84, 70, 65, 70, 51, 'いわ', 'じめん', 'だっぴ', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('385', 'バンギラス', 100, 134, 110, 95, 100, 61, 'いわ', 'あく', 'すなおこし', null, 'きんちょうかん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('386', 'モノズ', 52, 65, 50, 45, 50, 38, 'あく', 'ドラゴン', 'はりきり', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('387', 'ジヘッド', 72, 85, 70, 65, 70, 58, 'あく', 'ドラゴン', 'はりきり', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('388', 'サザンドラ', 92, 105, 90, 125, 90, 98, 'あく', 'ドラゴン', 'ふゆう', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('389', 'ヌメラ', 45, 50, 35, 55, 75, 40, 'ドラゴン', null, 'そうしょく', 'うるおいボディ', 'ぬめぬめ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('390', 'ヌメイル', 68, 75, 53, 83, 113, 60, 'ドラゴン', null, 'そうしょく', 'うるおいボディ', 'ぬめぬめ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('391', 'ヌメルゴン', 90, 100, 70, 110, 150, 80, 'ドラゴン', null, 'そうしょく', 'うるおいボディ', 'ぬめぬめ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('392', 'ジャラコ', 45, 55, 65, 45, 45, 45, 'ドラゴン', null, 'ぼうだん', 'ぼうおん', 'ぼうじん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('393', 'ジャランゴ', 55, 75, 90, 65, 70, 65, 'ドラゴン', null, 'ぼうだん', 'ぼうおん', 'ぼうじん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('394', 'ジャラランガ', 75, 110, 125, 100, 105, 85, 'ドラゴン', 'かくとう', 'ぼうだん', 'ぼうおん', 'ぼうじん')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('395', 'ドラメシヤ', 208, 60, 30, 40, 30, 82, 'ドラゴン', 'ゴースト', 'クリアボディ', 'すりぬけ', 'のろわれボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('396', 'ドロンチ', 68, 80, 50, 60, 50, 102, 'ドラゴン', 'ゴースト', 'クリアボディ', 'すりぬけ', 'のろわれボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('397', 'ドラパルト', 88, 120, 75, 100, 75, 142, 'ドラゴン', 'ゴースト', 'クリアボディ', 'すりぬけ', 'のろわれボディ')");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('398-1', 'ザシアン(れきせんのゆうしゃ)', 92, 130, 115, 80, 115, 138, 'フェアリー', null, 'ふとうのけん', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('398-2', 'ザシアン(けんのおう)', 92, 170, 115, 80, 115, 148, 'フェアリー', 'はがね', 'ふとうのけん', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('399-1', 'ザマゼンタ(れきせんのゆうしゃ)', 92, 130, 115, 80, 115, 138, 'かくとう', null, 'ふくつのたて', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('399-2', 'ザマゼンタ(たてのおう)', 92, 130, 145, 80, 145, 128, 'かくとう', 'はがね', 'ふくつのたて', null, null)");
    await db.rawInsert(
        "INSERT INTO $table ($columnPokeId, $columnName, $columnH, $columnA, $columnB, $columnC, $columnD, $columnS, $columnType1, $columnType2, $columnAbility1, $columnAbility2, $columnAbility3) VALUES('400', 'ムゲンダイナ', 140, 85, 95, 145, 95, 130, 'どく', 'ドラゴン', 'プレッシャー', null, null)");
  }
}
