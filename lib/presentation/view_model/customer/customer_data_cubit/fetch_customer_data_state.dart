part of 'fetch_customer_data_cubit.dart';

abstract class FetchCustomerDataState {}

class FetchCustomerDataInitial extends FetchCustomerDataState {}

class FetchCustomerDataLoading extends FetchCustomerDataState {}

class FetchCustomerDataSuccess extends FetchCustomerDataState {
  final List<CustomerEntity> customerEntityList;

  FetchCustomerDataSuccess(this.customerEntityList);
}

class FetchCustomerDataFailed extends FetchCustomerDataState {
  final String errorMessage;

  FetchCustomerDataFailed(this.errorMessage);
}
