import 'package:sqflite/sqflite.dart' as sql;

class SQLHelperAnimals {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE animals(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        animal INTEGER,
        
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'database_animal_10.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
      int animal,
      ) async {
    final db = await SQLHelperAnimals.db();

    final data = {
      'animal': animal,
    };
    final id = await db.insert('animals', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelperAnimals.db();
    return db.query('animals', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelperAnimals.db();
    return db.query('animals', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id,
      int animal,
      ) async {
    final db = await SQLHelperAnimals.db();

    final data = {
      'animal': animal,
    };

    final result =
    await db.update('animals', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelperAnimals.db();
    try {
      await db.delete("animals", where: "id = ?", whereArgs: [id]);
    } catch (err) {
    }
  }
}