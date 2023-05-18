import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/data/source/abstract_database_operations.dart';
import 'package:bbs/data/source/abstract_table_statements.dart';
import 'package:bbs/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class TransferRepositoryImpl extends TransferRepository {
  final SqfLiteOperations sqfLiteOperations;

  TransferRepositoryImpl(this.sqfLiteOperations);

  @override
  Future<Either<OnFailure, Database>> createMoneyTransferTable() async {
    try {
      Database dp = await sqfLiteOperations.createTable();
      return Right(dp);
    } catch (e) {
      return Left(
        OnFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<OnFailure, List<TransferProcessModel>>>
      fetchTransferredData() async {
    try {
      List<TransferProcessModel> model =
          await sqfLiteOperations.getFromDatabase(
              database: SQLSharedInstances.onOpenDatabaseInstanceGetter);
      return Right(model);
    } catch (e) {
      return Left(
        OnFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<OnFailure, int>> insertTransferProcess() async {
    try {
      int recordId = await sqfLiteOperations.insertIntoDatabase();
      return Right(recordId);
    } catch (e) {
      return Left(OnFailure(e.toString()));
    }
  }
}
