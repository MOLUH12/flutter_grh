import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/personnel.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._();
  static Database? _database;

  DatabaseProvider._();

  factory DatabaseProvider() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'gestion_rh.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE personnel(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, position TEXT)',
    );
  }

  Future<void> insertPersonnel(Personnel personnel) async {
    final db = await database;
    await db.insert('personnel', personnel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Personnel>> fetchAllPersonnel() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('personnel');
    return List.generate(maps.length, (i) {
      return Personnel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        position: maps[i]['position'],
      );
    });
  }
}
