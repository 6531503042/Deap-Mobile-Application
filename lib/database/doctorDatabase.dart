import 'package:dentist_appointment/models/doctor_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DoctorDatabase {
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
      if (kDebugMode) {
        print('Error initializing database: $ex');
      }
    }
  }

  static void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE doctors(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        patient INTEGER,
        experience INTEGER,
        specialization TEXT,
        description TEXT,
        reviews TEXT,
        rating DOUBLE,
        image TEXT
      )
    ''');
  }

  static Future<void> addDoctor(Doctor doctor) async {
    await initDatabase();
    await _database!.insert('doctors', doctor.toMap());
  }

  static Future<List<Map<String, dynamic>>> getDoctors() async {
    await initDatabase();
    return await _database!.query('doctors');
  }

  static Future<void> deleteDoctor(int id) async {
    await initDatabase();
    await _database!.delete('doctors', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateDoctor(Doctor doctor) async {
    await initDatabase();
    await _database!.update('doctors', doctor.toMap(),
        where: 'id = ?', whereArgs: [doctor.id]);
  }
}
