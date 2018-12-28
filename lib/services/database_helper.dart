import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_list.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String favoriteMovieTable = 'MOVIE';
  final String idColumn = 'id';
  final String voteAverageColumn = 'vote_average';
  final String title = 'title';
  final String posterPathColumn = 'poster_path';
  final String overviewColumn = 'overview';
  final String releaseColumn = 'release';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'movie.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $favoriteMovieTable ('
        '$idColumn INTEGER,'
        '$voteAverageColumn DECIMAL,'
        '$title TEXT,'
        '$posterPathColumn TEXT,'
        '$overviewColumn TEXT,'
        '$releaseColumn TEXT'
        ')');
  }

  Future<int> addFavoriteMovie(Movie movie) async {
    var dbClient = await db;
    return await dbClient.insert(favoriteMovieTable, movie.toMap());
  }

  Future<List> getAllFavoriteMovies() async {
    var dbClient = await db;
    var results = await dbClient.rawQuery('SELECT * from $favoriteMovieTable');
    return results.toList();
  }

  Future<int> getNumberOfFavoriteMovies() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM $favoriteMovieTable'));
  }

  Future<Movie> getFavoriteMovieFromId(int id) async {
    var dbClient = await db;
    List<Map> result =
      await dbClient.rawQuery('SELECT * FROM $favoriteMovieTable WHERE $idColumn = $id');

    return result.length > 0 ? Movie.fromMap(result.first) : null;
  }

  Future<int> updateFavoriteMovie(Movie movie) async {
    var dbClient = await db;
    return null;
  }

  Future<int> removeFavoriteMovie(int id) async {
    var dbClient = await db;
    return await dbClient.delete(favoriteMovieTable, where: '$idColumn = ?', whereArgs: [id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}