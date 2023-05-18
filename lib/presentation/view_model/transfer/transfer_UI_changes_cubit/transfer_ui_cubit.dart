import 'package:flutter_bloc/flutter_bloc.dart';
part 'transfer_ui_state.dart';

class TransferUiCubit extends Cubit<TransferUiState> {
  TransferUiCubit() : super(TransferUiInitial());

  static TransferUiCubit get(context) => BlocProvider.of(context);

  bool transferProcessSuccessful = false;

  void transferSuccess() {
    transferProcessSuccessful = true;
    emit(TransferButtonSuccess());
  }
}
