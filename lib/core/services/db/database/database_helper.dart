import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/futures/home/domain/models/task_item_model.dart';
import 'migrations.dart';

class DBHelper extends Migrations {
  String table = "";

  DBHelper(this.table, Map fields) : super(table, fields);

  Future get database async {
    var path = join(await getDatabasesPath(), '${table}_database.db');
    return openDatabase(
      path,
      onCreate: (db, version) => db.execute(statement),
      version: 1,
    );
  }

  Future<String> get path async =>
      join(await getDatabasesPath(), '${table}_database.db');

  Future<TaskItemModel?> getItem(int id) async {
    var db = await database;

    var result = await db
        .rawQuery("SELECT * FROM $table WHERE id = $id");

    if (result.length == 0) return null;

    return TaskItemModel.fromJson(result.first);
  }

  Future<int> insert() async {
    final db = await database;

    return await db.insert(
      table,
      toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  get() async {
    final db = await database;
    return await db.query(table);
  }

  Future update(id) async {
    final db = await database;
    return await db.update(
      table,
      toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> erase() async {
    final db = await database;

    var data = await get();

    for (Map model in data) {
      await db.delete(
        table,
        where: 'id = ?',
        whereArgs: [model['id']],
      );
    }
  }

  Map<String, Object?> toMap() => {};
}
