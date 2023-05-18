import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/data/source/abstract_database_operations.dart';
import 'package:bbs/data/source/abstract_table_statements.dart';
import 'package:bbs/data/source/transfer_database/sql_statements.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteOperationsTransferImpl extends SqfLiteOperations {
  Database? database;
  SQLTableTransferImpl sqlTableTransferImpl = SQLTableTransferImpl();

  SqfLiteOperationsTransferImpl(this.database);

  @override
  Future<Database> createTable() async {
    database = await openDatabase(
      SQLSharedInstances.databaseName,
      version: SQLSharedInstances.databaseVersion,
      onCreate: sqlTableTransferImpl.onCreateDatabase(),
      onOpen: sqlTableTransferImpl.onOpenDatabase(),
    );
    return database!;
  }

  @override
  Future insertIntoDatabase() async => await SQLSharedInstances
      .onOpenDatabaseInstanceGetter
      .transaction((txn) async => sqlTableTransferImpl.rawInserted(txn: txn));

  @override
  Future<List<TransferProcessModel>> getFromDatabase(
      {required Database database}) async {
    List<Map<String, dynamic>> list =
        await database.rawQuery(TransferDatabaseStatementsDML.getAllStatement);
    List<TransferProcessModel> fetchTransferDataList = _transferDataList(list);
    return fetchTransferDataList;
  }

  List<TransferProcessModel> _transferDataList(
      List<Map<String, dynamic>> list) {
    List<TransferProcessModel> fetchTransferDataList = [];
    for (var element in list) {
      fetchTransferDataList.add(
        TransferProcessModel(
          senderID: element['senderID'],
          senderName: element['senderName'],
          senderBalance: element['senderBalance'],
          receiverID: element['receiverID'],
          receiverName: element['receiverName'],
          receiverBalance: element['receiverBalance'],
          amountOfMoney: element['amountOfMoneyTransferred'],
        ),
      );
    }
    return fetchTransferDataList;
  }
}
