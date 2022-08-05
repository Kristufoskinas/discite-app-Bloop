import 'package:bloop/components/note.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase.init();

  static Database? _database;

  NotesDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db'); //notes.db - database
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    await db.execute('''
CREATE TABLE $tableNotes (
  ${NoteFields.id} $idType, 
  ${NoteFields.isImportant} $boolType,
  ${NoteFields.number} $integerType,
  ${NoteFields.title} $textType, 
  ${NoteFields.description} $textType, 
  ${NoteFields.time} $textType,
  )
''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
