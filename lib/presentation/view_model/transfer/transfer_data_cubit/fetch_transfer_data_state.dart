part of 'fetch_transfer_data_cubit.dart';

abstract class FetchTransferDataState {}

class FetchTransferDataInitial extends FetchTransferDataState {}

class FetchTransferDataLoading extends FetchTransferDataState {}

class FetchTransferDataSuccess extends FetchTransferDataState {
  final List<TransferProcessModel> transferProcessModel;

  FetchTransferDataSuccess(this.transferProcessModel);
}

class FetchTransferDataFailed extends FetchTransferDataState {
  final String error;

  FetchTransferDataFailed(this.error);
}
