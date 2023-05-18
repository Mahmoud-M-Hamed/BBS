import 'package:sqflite/sqflite.dart';

abstract class SqfLiteOperations<GetGenericType> {
  Future<Database> createTable();

  Future insertIntoDatabase();

  Future<GetGenericType> getFromDatabase({required Database database});
}

abstract class SqfLiteUpdateOperation {
  Future updateRecord();
}
