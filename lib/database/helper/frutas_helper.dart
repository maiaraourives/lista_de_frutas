import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/frutas_model_database.dart';
import '../tables/fruta_table.dart';

class FrutasDatabaseHelper {
  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'frutas.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${TableFruta.tableName} SET '
          '${TableFruta.id} = ?, '
          '${TableFruta.title} = ?, '
          '${TableFruta.iconPath} = ?, '
      )
    ''');
  }

  Future<void> savelistaFrutas(List<FrutaDatabaseModel> frutas) async {
    final db = await _openDatabase();
    await db.transaction((txn) async {
      await txn.delete(TableFruta.tableName);
      for (var fruta in frutas) {
        await txn.insert(TableFruta.tableName, fruta.toMap());
      }
    });
  }

  Future<List<FrutaDatabaseModel>> getlistaFrutas() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TableFruta.tableName);
    return List.generate(maps.length, (index) {
      return FrutaDatabaseModel(
        title: maps[index]['title'],
        iconPath: maps[index]['iconPath'],
      );
    });
  }
}
