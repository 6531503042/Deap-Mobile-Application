import 'package:dentist_appointment/models/appointment_model.dart';
import 'package:dentist_appointment/models/doctor_model.dart';
import 'package:dentist_appointment/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Import the path package

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    // Return new database
    _database = await _initDatabase();
    if (kDebugMode) {
      print("Database created");
    }
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'flutter_sqflite_database.db');

    deleteDatabase(path);

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys=ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    //Attach with Forein - Key
    // Create the user table
    await db.execute('''
    CREATE TABLE user (
      id INTEGER PRIMARY KEY,
      name TEXT,
      email TEXT, // Add the email column here
      password TEXT,
      phoneNumber TEXT,
      image TEXT
        )
      ''');
    await db.execute(
      'CREATE TABLE doctor(id INTEGER PRIMARY KEY, name TEXT)',
    );

    //Without Foreign - Key
    await db.execute(
      'CREATE TABLE appointment('
      'id INTEGER PRIMARY KEY, '
      'time TEXT, '
      'date TEXT, '
      'condition TEXT, '
      'status TEXT, '
      'userId INTEGER, '
      'doctorId INTEGER, '
      'FOREIGN KEY(userId) REFERENCES user(id),'
      'FOREIGN KEY(doctorId) REFERENCES doctor(id)'
      ')',
    );

    //insert initialze the first data
    await db.execute(
      'INSERT INTO user (name, email, password, phoneNumber, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [
        "Phumiphat Wongsatit",
        "6531503120@lamduan.mfu.ac.th",
        "1234",
        "1234324342",
        'assets/reviewer1.png'
      ],
    );

    List<String> doctorNames = [
      'Dr. Jirapan Phetkhao',
      'Dr. Mensah T',
      'Dr. John Doe',
      'Dr. Jane Smith',
      'Dr. Emily Johnson',
      'Dr. Michael Brown',
      'Dr. Sarah Davis',
      'Dr. Kevin Wilson',
    ];

    List<String> experiences = [
      '10 Year',
      '5 Year',
      '8 Year',
      '15 Year',
      '12 Year',
      '7 Year',
      '9 Year',
      '11 Year',
    ];

    List<String> specializations = [
      'Dentist',
      'Orthopedic Surgeon',
      'Cardiologist',
      'Pediatrician',
      'Neurologist',
      'Dermatologist',
      'Gynecologist',
      'Urologist',
    ];

    List<String> descriptions = [
      'Dr. Pla is a top specialist at London Bridge Hospital at London. He has achieved several awards and recognition for his contribution and service in his field. He is available for private consultation.',
      'Dr. Mensah T. is a mid-range specialist at London Bridge Hospital at London. He has achieved several awards and recognition for his contribute and service in his field. He is available for private consultation.',
      'Dr. John Doe is a highly skilled cardiologist with years of experience in treating various heart conditions.',
      'Dr. Jane Smith specializes in pediatric care and has a warm and caring approach to treating children.',
      'Dr. Emily Johnson is a renowned neurologist known for her expertise in treating complex neurological disorders.',
      'Dr. Michael Brown is a leading dermatologist with a focus on skincare and dermatological surgeries.',
      'Dr. Sarah Davis is a gynecologist known for her compassionate care and expertise in women\'s health.',
      'Dr. Kevin Wilson is a urologist specializing in male and female urinary tract and reproductive system disorders.',
    ];

    List<String> reviews = [
      'Dr. Praa is truly a professional about our teeth.',
      'Dr Mensah T. is perform really good on dentist',
      'Dr. John Doe is very knowledgeable and caring. I highly recommend him.',
      'Dr. Jane Smith is amazing with kids. My child loves her!',
      'Dr. Emily Johnson is a lifesaver. She accurately diagnosed my condition and provided effective treatment.',
      'Dr. Michael Brown transformed my skin. I feel more confident than ever!',
      'Dr. Sarah Davis is so understanding and knowledgeable. I feel safe in her care.',
      'Dr. Kevin Wilson helped me overcome my urological issues. Highly recommend!',
    ];

    List<double> ratings = [
      4.5,
      4.0,
      4.8,
      4.3,
      4.6,
      4.7,
      4.9,
      4.2,
    ];

    List<int> userIds = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    ];

    List<String> imageAssets = [
      'assets/doctor1.png',
      'assets/doctor2.png',
      'assets/doctor3.png',
      'assets/doctor4.png',
      'assets/doctor5.png',
      'assets/doctor6.png',
      'assets/doctor7.png',
      'assets/doctor8.png',
    ];

    await db.execute(
      'CREATE TABLE doctor('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'experience TEXT, '
      'specialization TEXT, '
      'description TEXT, '
      'reviews TEXT, '
      'rating REAL, '
      'imgAsset TEXT, '
      'user_id INTEGER, '
      'FOREIGN KEY(user_id) REFERENCES user(id)'
      ')',
    );

    for (int i = 0; i < doctorNames.length; i++) {
      await db.execute(
        'INSERT INTO doctor (name, experience, specialization, description, reviews, rating, imgAsset, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [
          doctorNames[i],
          experiences[i],
          specializations[i],
          descriptions[i],
          reviews[i],
          ratings[i],
          imageAssets[i],
          userIds[i],
        ],
      );
    }

    Future<List<Doctor>> getAllDoctors() async {
      final db = await _databaseService.getDatabase();

      //query the table for all
      final List<Map<String, dynamic>> maps = await db.query('doctor');

      //convert the list<map> to a list<Doctor> into List<Doctor>
      return List.generate(maps.length, (i) => Doctor.fromMap(maps[i]));
    }

    Future<Doctor> getDoctorById(int id) async {
      final db = await _databaseService.getDatabase();

      final List<Map<String, dynamic>> maps =
          await db.query('doctor', where: 'id = ?', whereArgs: [id]);
      return Doctor.fromMap(maps[0]);
    }

    Future<void> addAppointment(Appointment appointment) async {
      final db = await _databaseService.getDatabase();
      await db.insert('appointment', appointment.toMap());
    }

    Future<bool> login(User user) async {
      final db = await _databaseService.getDatabase();

      // Query the user table to check if the provided username and password match
      final List<Map<String, dynamic>> maps = await db.query(
        'user',
        where: 'usrName = ? AND usrPassword = ?',
        whereArgs: [user.usrName, user.usrPassword],
      );

      // If there is a matching user, return true; otherwise, return false
      return maps.isNotEmpty;
    }


    Future<int> register(User user) async {
      final db = await _databaseService.getDatabase();

      return db.insert('user', user.toMap());
    }

    Future<List<Appointment>> getAppointments() async {
      final db = await _databaseService.getDatabase();
      final List<Map<String, dynamic>> maps = await db.query('appointment');
      return List.generate(maps.length, (i) {
        return Appointment.fromMap(maps[i]);
      });
    }

    Future<void> updateAppointment(Appointment appointment) async {
      final db = await _databaseService.getDatabase();
      await db.update('appointment', appointment.toMap(),
          where: "id=?", whereArgs: [appointment.id]);
    }
  }

  Future<void> updateDoctor(Doctor doctor) async {
    final db = await _databaseService.getDatabase();
    await db.update(
      'doctor',
      doctor.toMap(),
      where: 'id = ?',
      whereArgs: [doctor.id],
    );
  }

  Future<void> deleteAppointment(int id) async {
    final db = await _databaseService.getDatabase();

    await db.delete(
      'appointment',
      where: 'id=?',
      whereArgs: [id],
    );
  }

  
}
