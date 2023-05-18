import 'package:bbs/data/mapper/to_domain.dart';
import 'package:bbs/data/models/customer_model.dart';
import 'package:bbs/data/models/model_local_strings.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/data/source/abstract_table_statements.dart';
import 'package:bbs/data/source/check_database_exist.dart';
import 'package:bbs/data/source/customer_database/sql_operations_impl.dart';
import 'package:bbs/data/source/transfer_database/sql_statements.dart';
import 'package:sqflite/sqflite.dart';

import '../../../application/service_setup_locator/dependancy_injection.dart';

class CustomerDatabaseStatementsDML {
  static const String getAllStatement = 'SELECT * FROM Customers';

  static const String createTableStatement =
      'CREATE TABLE Customers (id INTEGER PRIMARY KEY, name TEXT, email TEXT, currentBalance REAL)';

  static String insertIntoStatement(int index) =>
      'INSERT INTO Customers (name, email, currentBalance)'
      ' VALUES("${CustomerModel.customerInfoList[index].toDomain().name}", '
      '"${CustomerModel.customerInfoList[index].toDomain().email}", '
      '${CustomerModel.customerInfoList[index].toDomain().currentBalance})';

  static String updateStatementReceiver() =>
      'UPDATE Customers SET currentBalance = '
      '${locatorService.get<TransferProcessModel>().receiverBalance} '
      'WHERE id = ${locatorService.get<TransferProcessModel>().receiverID}';

  static String updateStatementSender() =>
      'UPDATE Customers SET currentBalance = '
      '${locatorService.get<TransferProcessModel>().senderBalance} '
      'WHERE id = ${locatorService.get<TransferProcessModel>().senderID}';
}

class SQLTableCustomerImpl extends SQLTableStatements
    with SQLUpdateTableStatements {
  @override
  OnDatabaseCreateFn onCreateDatabase() => onCreateDatabases;

  @override
  OnDatabaseOpenFn onOpenDatabase() => onOpenDatabases;

  @override
  Future rawInserted({required Transaction txn}) => rawInsertd(txn: txn);

  static OnDatabaseCreateFn onCreateDatabases =
      (Database database, int version) async {
    await database.execute(CustomerDatabaseStatementsDML.createTableStatement);
    await database.execute(TransferDatabaseStatementsDML.createTableStatement);
  };

  static OnDatabaseOpenFn onOpenDatabases = (Database database) async {
    SQLSharedInstances.onOpenDatabaseInstance = database;
    if (CheckDatabaseExistence.databaseExistenceChecker == false) {
      await SqfLiteOperationsCustomerImpl(database).insertIntoDatabase();
    }
  };

  Future rawInsertd({required Transaction txn}) async {
    for (int i = 0; i < ConstantsStringModel.idsList.length; i++) {
      await txn.rawInsert(CustomerDatabaseStatementsDML.insertIntoStatement(i));
    }
  }

  @override
  Future<int> rawUpdated({required Database dp}) async {
    await dp.rawUpdate(CustomerDatabaseStatementsDML.updateStatementSender());
    return await dp
        .rawUpdate(CustomerDatabaseStatementsDML.updateStatementReceiver());
  }
}
