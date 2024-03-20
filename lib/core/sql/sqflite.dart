import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDb {
  static Database? _database ;

  Future<Database?> get database async{
    if(_database == null){
      _database = await init();
      return _database;
    }
    else{
      return _database;
    }
  }


  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'movies.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
    return database;
  }

  onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE 'favourites' (id TEXT , title TEXT , image TEXT , rating TEXT , isFilm INTEGER)");
  }

  Future<List<Map>> getData()async{
    Database? myDatabase = await database;
    List<Map<String,dynamic>> response = await myDatabase!.rawQuery("SELECT * FROM 'favourites'");
    return response;

  }

  Future<void> insertData({
    required String id,
    required String title,
    required String image,
    required String rating,
    required int isFilm // Film =1 & Series = 0
  })async{
    Database? myDatabase = await database;
    await myDatabase!.rawInsert("INSERT INTO 'favourites' ('id' ,'title', 'image', 'rating', 'isFilm') VALUES( '$id' , '$title' , '$image' , '$rating' , '$isFilm')");
  }

  Future<int> deleteData({
    required String id,
  })async{
    Database? myDatabase = await database;
    int bookId = await myDatabase!.rawDelete("DELETE FROM 'favourites' WHERE id = ?", [id]);
    return bookId;
  }
}












//
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// import '../../features/home/data/models/movie_model.dart';
//
//
//
//
// String columnId = 'id';
// String moviesTable = 'movies';
// class Sql {
//   static late Database db;
//
//   static final Sql instance = Sql._internal();
//
//   factory Sql() {
//     return instance;
//   }
//
//
//
//   Sql._internal();
//
//   Future open() async {
//     db = await openDatabase(
//       join(await getDatabasesPath(), 'movies.db'),
//       version: 1,
//       onCreate: (Database db, int version) async {
//         print('Created');
//         await db.execute('''
//         CREATE TABLE $moviesTable (
//           $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//           title TEXT NOT NULL,
//           image TEXT NOT NULL,
//           movieId TEXT NOT NULL,
//         )
//       ''');
//       },
//     );
//   }
//
//
//   static Future insertProducts(MovieModel movie) async {
//     await db.insert(moviesTable, {
//       'title' : movie.title,
//       'image' : movie.image,
//       'movieId' : movie.id,
//     });
//   }
//
//   Future<int> updateProducts(MovieModel movie) async {
//     return await db.update(
//       moviesTable,
//       {
//         'title' : movie.title,
//         'image' : movie.image,
//         'movieId' : movie.id,
//       },
//       where: '$columnId = ?',
//       whereArgs: [movie.id],
//     );
//   }
//
//   Future<int> deleteProducts(int id) async {
//     return await db.delete(
//       moviesTable,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//   }
//
//
//   static Future<List<MovieModel>> getAllProducts() async {
//     List<Map<String, dynamic>> moviesData = await db.query(moviesTable);
//     if (moviesData.isEmpty) {
//       return [];
//     } else {
//       List<MovieModel> movies = [];
//       for (var element in moviesData) {
//         movies.add(MovieModel.fromJson(element));
//       }
//       return movies;
//     }
//   }
//
//
//   Future close() async => db.close();
//
//
// }