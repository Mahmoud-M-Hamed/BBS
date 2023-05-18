import 'package:bbs/application/service_setup_locator/dependancy_injection.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/data/source/abstract_table_statements.dart';
import 'package:sqflite/sqflite.dart';

class TransferDatabaseStatementsDML {
  static const String getAllStatement = 'SELECT * FROM Transfers';

  static const String createTableStatement =
      'CREATE TABLE Transfers (processNumber INTEGER PRIMARY KEY,'
      'senderID INTEGER, senderName TEXT, senderBalance REAL,'
      'receiverID INTEGER, receiverName TEXT, receiverBalance REAL,'
      'amountOfMoneyTransferred REAL)';

  String insertIntoStatement() => "INSERT INTO Transfers ("
      "senderID, senderName, senderBalance, "
      "receiverID, receiverName, receiverBalance, "
      "amountOfMoneyTransferred) VALUES ("
      "${locatorService.get<TransferProcessModel>().senderID}, "
      "'${locatorService.get<TransferProcessModel>().senderName}', "
      "${locatorService.get<TransferProcessModel>().senderBalance}, "
      "${locatorService.get<TransferProcessModel>().receiverID}, "
      "'${locatorService.get<TransferProcessModel>().receiverName}', "
      "${locatorService.get<TransferProcessModel>().receiverBalance}, "
      "${locatorService.get<TransferProcessModel>().amountOfMoney})";
}

class SQLTableTransferImpl extends SQLTableStatements {
  @override
  OnDatabaseCreateFn onCreateDatabase() {
    return onCreateDatabases;
  }

  @override
  OnDatabaseOpenFn onOpenDatabase() {
    return onOpenDatabases;
  }

  @override
  Future rawInserted({required Transaction txn}) =>
      rawInsertedImpl(transaction: txn);

  Future rawInsertedImpl({required Transaction transaction}) async {
    await transaction
        .rawInsert(TransferDatabaseStatementsDML().insertIntoStatement());
  }

  static OnDatabaseCreateFn onCreateDatabases =
      (Database database, int version) async {
    await database.execute(TransferDatabaseStatementsDML.createTableStatement);
  };

  static OnDatabaseOpenFn onOpenDatabases = (Database dp) async {
    SQLSharedInstances.onOpenDatabaseInstance = dp;
  };
}
