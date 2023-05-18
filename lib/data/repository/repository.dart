import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/data/models/customer_model.dart';
import 'package:bbs/data/source/abstract_table_statements.dart';
import 'package:bbs/data/source/check_database_exist.dart';
import 'package:bbs/data/source/abstract_database_operations.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:bbs/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class RepositoryImpl extends Repository {
  final SqfLiteOperations sqlDataSource;
  final SqfLiteUpdateOperation sqfLiteUpdateOperation;

  RepositoryImpl(
      {required this.sqfLiteUpdateOperation, required this.sqlDataSource});

  @override
  Future<Either<OnFailure, List<CustomerEntity>>> fetchCustomerInfo() async {
    try {
      List<CustomerEntity> customerData = await sqlDataSource.getFromDatabase(
          database: SQLSharedInstances.onOpenDatabaseInstanceGetter);
      return Right(customerData);
    } catch (e) {
      return Left(OnFailure(e.toString()));
    }
  }

  @override
  Future<Either<OnFailure, Database>> createCustomerDatabase() async {
    try {
      CustomerModel.customerInfo;
      await CheckDatabaseExistence.check;
      Database createTable = await sqlDataSource.createTable();
      return Right(createTable);
    } catch (e) {
      return Left(OnFailure(e.toString()));
    }
  }

  @override
  Future<Either<OnFailure, int>> updateCustomerInfo() async {
    try {
      int updatedRecordId = await sqfLiteUpdateOperation.updateRecord();
      return Right(updatedRecordId);
    } catch (e) {
      return Left(OnFailure(e.toString()));
    }
  }
}
