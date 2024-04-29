import 'package:dentist_appointment/models/appointment_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppointmentDatabase {
  static const int version = 1;
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
      CREATE TABLE appointments(
        id INTEGER PRIMARY KEY,
        drName TEXT,
        time TEXT,
        date TEXT,
        condition TEXT,
        status TEXT
      )
    ''');
  }

  static Future<void> addAppointment(Appointment appointment) async {
    await initDatabase();
    await _database!.insert('appointments', appointment.toMap());
  }

  static Future<List<Appointment>> getAppointments() async {
    await initDatabase();
    List<Map<String, dynamic>> maps = await _database!.query('users');
    return List.generate(maps.length, (i) {
      return Appointment.fromMap(maps[i]);
    });
  }

  static Future<void> updateAppointment(Appointment appointment) async {
    await initDatabase();
    await _database!.update(
      'appointments',
      appointment.toMap(),
      where: "id=?",
      whereArgs: [appointment.id],
    );
  }

  static Future<void> deleteAppointment(int id) async {
    await _database!.delete(
      'appointments',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
