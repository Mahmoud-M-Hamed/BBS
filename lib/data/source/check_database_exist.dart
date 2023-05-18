import 'package:sqflite/sqflite.dart';

class CheckDatabaseExistence {
  static bool? databaseExistenceChecker;

  static Future<bool> get check async {
    String databasesPath = await getDatabasesPath();
    bool databaseExistenceChecker =
        await _checkDatabaseExistence(databasesPath: databasesPath);
    CheckDatabaseExistence.databaseExistenceChecker = databaseExistenceChecker;
    return databaseExistenceChecker;
  }

  static Future<bool> _checkDatabaseExistence(
      {required String databasesPath}) async {
    bool databaseExist = await databaseExists(databasesPath);
    if (databaseExist) {
      return true;
    }
    return databaseExist;
  }
}
