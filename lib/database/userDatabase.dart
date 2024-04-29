@ -0,0 +1,54 @@
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dentist_appointment/models/user_model.dart';

class UserDatabase {
  static Database? _database;

  static Future<void> initDatabase() async {
    if (_database != null) {
      return;
    }
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'dentist_appointment.db');
      _database = await openDatabase(path, version: 1, onCreate: _createDb);
    } catch (ex) {
      print('Error initializing database: $ex');
    }
  }

  static void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        password TEXT,
        phone_number TEXT,
        image TEXT
      )
    ''');
  }

  static Future<void> addUser(User user) async {
    await initDatabase();
    await _database!.insert('users', user.toMap());
  }

  static Future<List<User>> getUsers() async {
    await initDatabase();
    List<Map<String, dynamic>> maps = await _database!.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        email: maps[i]['email'] as String,
        password: maps[i]['password'] as String,
        phoneNumber: maps[i]['phone_number'] as String,
        image: maps[i]['image'] as String,
        myAppointments: [], // You may need to load appointments from another table
      );
    });
  }
}