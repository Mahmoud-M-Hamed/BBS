import 'package:bbs/application/extensions/extensions.dart';
import 'package:bbs/application/service_setup_locator/dependancy_injection.dart';
import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/domain/usecases/customer_usecases/update_customer_data.dart';
import 'package:bbs/domain/usecases/transfer_usecases/create_table.dart';
import 'package:bbs/domain/usecases/transfer_usecases/insert_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'transfer_database_state.dart';

class TransferDatabaseCubit extends Cubit<TransferDatabaseState> {
  TransferDatabaseCubit(
    this.createAndOpenTransferTableUseCase,
    this._insertTransferProcessUseCase, this._updateCustomerDataUseCase,
  ) : super(TransferDatabaseInitial());

  static TransferDatabaseCubit get(context) => BlocProvider.of(context);

  final CreateAndOpenTransferTableUseCase createAndOpenTransferTableUseCase;
  final InsertTransferProcessUseCase _insertTransferProcessUseCase;
  final UpdateCustomerDataUseCase _updateCustomerDataUseCase;

/*
  Future<void> createAndOpenTransferTable() async {
    emit(TransferCreateOpenDatabaseLoading());
    Either<OnFailure, Database> eitherResult =
        await createAndOpenTransferTableUseCase.execute();
    eitherResult.fold(
        (failure) => emit(TransferCreateOpenDatabaseFailed(failure.message)),
        (database) => emit(TransferCreateOpenDatabaseSuccess()));
  }*/

  Future insertTransferProcess(
      {required String senderID,
      required String senderName,
      required double senderBalance,
      required int receiverID,
      required String receiverName,
      required double receiverBalance,
      required String amountOfMoney}) async {
    emit(InsertTransferProcessLoading());
    _insertParamToTransferModel(
        senderID: senderID,
        senderName: senderName,
        senderBalance: senderBalance,
        receiverID: receiverID,
        receiverName: receiverName,
        receiverBalance: receiverBalance,
        amountOfMoney: amountOfMoney);
    await _insertAndUpdateCalling();
  }

  void _insertParamToTransferModel(
      {required String senderID,
      required String senderName,
      required double senderBalance,
      required int receiverID,
      required String receiverName,
      required double receiverBalance,
      required String amountOfMoney}) {
    locatorService.get<TransferProcessModel>().senderID =
        int.tryParse(senderID).orNull();
    locatorService.get<TransferProcessModel>().receiverID = receiverID;
    locatorService.get<TransferProcessModel>().amountOfMoney =
        double.tryParse(amountOfMoney).orNull();
    locatorService.get<TransferProcessModel>().senderName = senderName;
    locatorService.get<TransferProcessModel>().senderBalance =
        senderBalance - double.parse(amountOfMoney);
    locatorService.get<TransferProcessModel>().receiverName = receiverName;
    locatorService.get<TransferProcessModel>().receiverBalance =
        receiverBalance + double.parse(amountOfMoney);
  }

  Future _insertUseCaseExecute() async {
    Either<OnFailure, int> result =
        await _insertTransferProcessUseCase.execute();
    result.fold((failure) => emit(InsertTransferProcessFailed(failure.message)),
        (recordId) => emit(InsertTransferProcessSuccess()));
  }

  Future _insertAndUpdateCalling() async {
    await _insertUseCaseExecute().whenComplete(() async => await updateCustomerData());

  }


  Future updateCustomerData() async {
    Either<OnFailure, int> result = await _updateCustomerDataUseCase.execute();
    result.fold((failure) => emit(UpdateCustomerDataFailed(failure.message)),
            (updatedRecord) => emit(UpdateCustomerDataSuccess()));
  }
}
