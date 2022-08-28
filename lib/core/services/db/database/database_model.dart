
import 'database_helper.dart';
export 'sqlite_data_type.dart';

abstract class Model extends DBHelper{
  Model(String table, Map fields) : super(table, fields);

  Map<String, Object?> toMap();

  @override
  String toString();

  Future<List> all();

}