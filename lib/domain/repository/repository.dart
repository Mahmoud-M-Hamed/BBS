import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

abstract class Repository {
  Future<Either<OnFailure, Database>> createCustomerDatabase();

  Future<Either<OnFailure, List<CustomerEntity>>> fetchCustomerInfo();

  Future<Either<OnFailure, int>> updateCustomerInfo();
}

abstract class TransferRepository {
  Future<Either<OnFailure, Database>> createMoneyTransferTable();

  Future<Either<OnFailure, List<TransferProcessModel>>> fetchTransferredData();

  Future<Either<OnFailure, int>> insertTransferProcess();
}
