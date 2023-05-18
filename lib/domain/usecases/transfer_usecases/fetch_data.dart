import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/domain/repository/repository.dart';
import 'package:bbs/domain/usecases/customer_usecases/fetch_customer_data.dart';
import 'package:dartz/dartz.dart';

class FetchTransferDataUseCase extends UseCase {
  final TransferRepository repository;

  FetchTransferDataUseCase(this.repository);

  @override
  Future<Either<OnFailure, List<TransferProcessModel>>> execute() async {
    return await repository.fetchTransferredData();
  }
}
