import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/domain/usecases/customer_usecases/create_table.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit(this.createAndOpenCustomerDatabaseUseCase)
      : super(DatabaseInitial());

  static DatabaseCubit get(context) => BlocProvider.of(context);

  final CreateAndOpenCustomerDatabaseUseCase
      createAndOpenCustomerDatabaseUseCase;

  Future<void> createAndOpenDatabase() async {
    emit(DatabaseCreateLoading());
    Either<OnFailure, Database> eitherResult =
        await createAndOpenCustomerDatabaseUseCase.execute();
    eitherResult.fold((failure) => emit(DatabaseCreateFailed(failure.message)),
        (database) => emit(DatabaseCreateSuccess()));
  }
}
