import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Workouts {
  final int? id;
  final String name;
  final String link;
  final int days;
  final String website;

  Workouts({this.id, required this.name, required this.link, required this.days, required this.website});

  factory Workouts.fromRawJson(String str) => Workouts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Workouts.fromJson(Map<String, dynamic> json) => Workouts(
    id: json['id'],
    name: json['name'],
    link: json['link'],
    days: json['days'],
    website: json['website'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'link': link,
      'days': days,
      'website': website,
    };
  }



}

class WorkoutHelper {
  WorkoutHelper._privateConstructor();
  static final WorkoutHelper instance = WorkoutHelper._privateConstructor();

  static Database? _database;
  //Future<Database> get database async => _database ??= await _initDatabase();

  void referenceDatabase() {
    DatabaseReference _testRef = FirebaseDatabase.instance.ref().child("Test");
    _testRef.set("Hello world ${Random().nextInt(100)}");
  }

  Future<void> _initDatabase() async {
    //Directory documentsDirectory = await getApplicationDocumentsDirectory();
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'workouts.db');
    var dbExists = await databaseExists(path);
    if (!dbExists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/db", "workouts.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }

    _database = await openDatabase(path, readOnly: true);
  }

  Future<List<Workouts>> getAllWorkouts() async {
    if (_database == null) {
      await _initDatabase();
      //print("database: " + _database.toString());
    }
    late List<Map> workoutList;
    //print(_database);
    var tableNames = (await _database?.query('sqlite_master', where: 'type = ?', whereArgs: ['table']))?.map((row) => row['name'] as String).toList(growable: false);


    await _database?.transaction((txn) async {
      workoutList = await txn.query(
        "workouts",
        columns: [
          "name",
          "link",
          "days",
          "website",
        ],
      );

    });

    return workoutList.map((e) => Workouts.fromJson(e as Map<String, dynamic>)).toList();
  }
}
