import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/domain/usecases/transfer_usecases/fetch_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_transfer_data_state.dart';

class FetchTransferDataCubit extends Cubit<FetchTransferDataState> {
  FetchTransferDataCubit(this.fetchTransferDataUseCase)
      : super(FetchTransferDataInitial());

  static FetchTransferDataCubit get(context) => BlocProvider.of(context);

  final FetchTransferDataUseCase fetchTransferDataUseCase;

  Future<void> fetchTransferData() async {
    emit(FetchTransferDataLoading());
    Either<OnFailure, List<TransferProcessModel>> eitherResult =
        await fetchTransferDataUseCase.execute();
    eitherResult.fold(
        (failure) => emit(FetchTransferDataFailed(failure.message)),
        (transferData) => emit(FetchTransferDataSuccess(transferData)));
  }
}
