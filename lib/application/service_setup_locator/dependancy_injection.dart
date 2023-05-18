import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/data/repository/repository.dart';
import 'package:bbs/data/repository/transfer_repo.dart';
import 'package:bbs/data/source/customer_database/sql_operations_impl.dart';
import 'package:bbs/data/source/transfer_database/sql_operations_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

GetIt locatorService = GetIt.instance;
Database? _database;

class DependencyInjectionService {
  static void get callSingletonDependency {
    sqlSingleton();
    databaseSingleton();
    transferDatabaseSingleton();
    transferModelSingleton();
  }

  static void databaseSingleton() {
    locatorService.registerSingleton<RepositoryImpl>(
      RepositoryImpl(
          sqlDataSource: locatorService.get<SqfLiteOperationsCustomerImpl>(),
          sqfLiteUpdateOperation: SqfLiteOperationsCustomerImpl(_database)),
    );
  }

  static void sqlSingleton() {
    locatorService.registerSingleton<SqfLiteOperationsCustomerImpl>(
      SqfLiteOperationsCustomerImpl(_database),
    );
  }

  static void transferDatabaseSingleton() {
    locatorService
        .registerSingleton<TransferRepositoryImpl>(TransferRepositoryImpl(
      SqfLiteOperationsTransferImpl(_database),
    ));
  }

  static void transferModelSingleton() {
    locatorService
        .registerSingleton<TransferProcessModel>(TransferProcessModel());
  }
}
