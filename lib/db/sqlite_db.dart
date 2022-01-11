import 'dart:async';
import 'dart:core';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

import 'movie_model.dart';
class SQLiteHelper{
  static Future<Database> openDB() async{
    const String createMovieTable = '''create table $tableMovie(
    $tableMovieColId integer primary key autoincrement,
    $tableMovieColName text not null,
    $tableMovieColCategory text not null,
    $tableMovieColReleaseDate text not null,
    $tableMovieColImage text not null,
    $tableMovieColRating text not null,
    $tableMovieColFavorite text not null)''';

    final root = await getDatabasesPath();
    final dbPath = Path.join(root, 'movie.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async{
      await db.execute(createMovieTable);

    });

  }
  static Future<int> insertMovie(Movie movie)async{
    final db = await openDB();
    return db.insert(tableMovie, movie.toMap());

  }
 static Future<List<Movie>>getAllMovies() async {
    final db = await openDB();
    final List<Map<String, dynamic>> mapList = await db.query(tableMovie);
    return List.generate(mapList.length, (index) => Movie.fromMap(mapList[index]));
 }
}