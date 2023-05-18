import 'dart:async';
import 'package:bbs/data/mapper/to_domain.dart';
import 'package:bbs/data/models/customer_model.dart';
import 'package:bbs/data/source/abstract_table_statements.dart';
import 'package:bbs/data/source/customer_database/sql_statements.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:sqflite/sqflite.dart';
import '../abstract_database_operations.dart';

class SqfLiteOperationsCustomerImpl extends SqfLiteOperations
    with SqfLiteUpdateOperation {
  Database? database;
  final SQLTableCustomerImpl _databaseStatements = SQLTableCustomerImpl();

  SqfLiteOperationsCustomerImpl(this.database);

  @override
  Future<Database> createTable() async {
    database = await openDatabase(
      SQLSharedInstances.databaseName,
      version: SQLSharedInstances.databaseVersion,
      onCreate: _databaseStatements.onCreateDatabase(),
      onOpen: _databaseStatements.onOpenDatabase(),
    );
    return database!;
  }

  @override
  Future insertIntoDatabase() async {
    await database!
        .transaction((txn) async => _databaseStatements.rawInserted(txn: txn));
  }

  @override
  Future<List<CustomerEntity>> getFromDatabase(
      {required Database database}) async {
    List<Map<String, dynamic>> list =
        await database.rawQuery(CustomerDatabaseStatementsDML.getAllStatement);
    List<CustomerEntity> fetchCustomerDataList = _customerDataList(list);
    return fetchCustomerDataList;
  }

  List<CustomerEntity> _customerDataList(List<Map<String, dynamic>> list) {
    List<CustomerEntity> fetchCustomerDataList = [];
    for (var customer in list) {
      fetchCustomerDataList.add(
        CustomerModel(
          id: customer['id'],
          name: customer['name'],
          email: customer['email'],
          currentBalance: customer['currentBalance'],
        ).toDomain(),
      );
    }
    return fetchCustomerDataList;
  }

  @override
  Future updateRecord() async => await _databaseStatements.rawUpdated(
        dp: SQLSharedInstances.onOpenDatabaseInstanceGetter);

}
