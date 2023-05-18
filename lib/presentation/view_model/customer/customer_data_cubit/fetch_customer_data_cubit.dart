import 'package:bbs/data/error_handler/failure.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:bbs/domain/usecases/customer_usecases/fetch_customer_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'fetch_customer_data_state.dart';

class FetchCustomerDataCubit extends Cubit<FetchCustomerDataState> {
  FetchCustomerDataCubit(this.fetchCustomerDataUseCase)
      : super(FetchCustomerDataInitial());

  static FetchCustomerDataCubit get(context) => BlocProvider.of(context);

  final FetchCustomerDataUseCase fetchCustomerDataUseCase;

  Future<void> fetchCustomerData() async {
    emit(FetchCustomerDataLoading());
    Either<OnFailure, List<CustomerEntity>> eitherResult =
        await fetchCustomerDataUseCase.execute();
    eitherResult.fold(
        (failure) => emit(FetchCustomerDataFailed(failure.message)),
        (customerDataList) => emit(FetchCustomerDataSuccess(customerDataList)));
  }
}
