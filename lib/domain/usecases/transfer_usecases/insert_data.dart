import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/domain/repository/repository.dart';
import 'package:bbs/domain/usecases/customer_usecases/fetch_customer_data.dart';
import 'package:dartz/dartz.dart';

class InsertTransferProcessUseCase extends UseCase {
  final TransferRepository transferRepository;

  InsertTransferProcessUseCase(this.transferRepository);

  @override
  Future<Either<OnFailure, int>> execute() async {
    return await transferRepository.insertTransferProcess();
  }
}
