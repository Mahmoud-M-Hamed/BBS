import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:bbs/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<GenericDataType> {
  Future<Either<OnFailure, GenericDataType>> execute();
}

class FetchCustomerDataUseCase extends UseCase {
  final Repository repository;

  FetchCustomerDataUseCase(this.repository);

  @override
  Future<Either<OnFailure, List<CustomerEntity>>> execute() async {
    return await repository.fetchCustomerInfo();
  }
}
