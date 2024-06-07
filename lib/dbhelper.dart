import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  var tableName = "Data";
  var columnId = "id";
  var columnName = "Name";
  var columnEmail = "email";
  var columnPassword = "password";
  var columnMobileNo = "Mobile_NO";

  Future<Database> openDb() async {
    var directory = await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);
    var path = directory.path + "Datadb.db";
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
        "Create table $tableName ( $columnId integer primary key autoincrement, $columnName text, $columnEmail text, $columnPassword text, $columnMobileNo integer)"
          );
    });
  }

  Future<void> addData(String name, String email, String password, String mobileNo, ) async {
    var db = await openDb();
    db.insert(tableName, {
      columnName: name,
      columnEmail: email,
      columnPassword: password,
      columnMobileNo: mobileNo,

    });
  }
}