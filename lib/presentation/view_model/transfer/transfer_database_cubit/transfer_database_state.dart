part of 'transfer_database_cubit.dart';

abstract class TransferDatabaseState {}

class TransferDatabaseInitial extends TransferDatabaseState {}

class TransferCreateOpenDatabaseLoading extends TransferDatabaseState {}

class TransferCreateOpenDatabaseSuccess extends TransferDatabaseState {}

class TransferCreateOpenDatabaseFailed extends TransferDatabaseState {
  final String errorMessage;

  TransferCreateOpenDatabaseFailed(this.errorMessage);
}

class InsertTransferProcessLoading extends TransferDatabaseState {}

class InsertTransferProcessSuccess extends TransferDatabaseState {}

class InsertTransferProcessFailed extends TransferDatabaseState {
  final String error;

  InsertTransferProcessFailed(this.error);
}

class UpdateCustomerDataLoading extends TransferDatabaseState {}

class UpdateCustomerDataSuccess extends TransferDatabaseState {}

class UpdateCustomerDataFailed extends TransferDatabaseState {
  final String error;

  UpdateCustomerDataFailed(this.error);
}
