import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/domain/repository/repository.dart';
import 'package:bbs/domain/usecases/customer_usecases/fetch_customer_data.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class CreateAndOpenCustomerDatabaseUseCase extends UseCase {
  final Repository repository;

  CreateAndOpenCustomerDatabaseUseCase(this.repository);

  @override
  Future<Either<OnFailure, Database>> execute() async {
    return await repository.createCustomerDatabase();
  }
}
