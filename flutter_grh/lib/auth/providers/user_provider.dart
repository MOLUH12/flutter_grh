import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  late Database _database;

  UserProvider() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'gestion_rh.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)',
        );
      },
    );
  }

  Future<void> addUser(User user) async {
    await _database.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<User?> getUserByUsername(String username) async {
    List<Map<String, dynamic>> maps = await _database.query('users',
        columns: ['id', 'username', 'password'],
        where: 'username = ?',
        whereArgs: [username]);

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
