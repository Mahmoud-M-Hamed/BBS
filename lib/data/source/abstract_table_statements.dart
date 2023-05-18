import 'package:sqflite/sqflite.dart';

abstract class SQLTableStatements {
  OnDatabaseCreateFn onCreateDatabase();

  OnDatabaseOpenFn onOpenDatabase();

  Future rawInserted({required Transaction txn});
}

abstract class SQLUpdateTableStatements {
  Future<int> rawUpdated({required Database dp});
}

class SQLSharedInstances {
  static const int databaseVersion = 1;
  static const String databaseName = 'bbs.dp';

  static Database? _dp;

  static set onOpenDatabaseInstance(Database dp) => _dp = dp;

  static Database get onOpenDatabaseInstanceGetter => _dp!;
}
