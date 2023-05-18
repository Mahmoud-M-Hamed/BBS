import 'package:auto_animated/auto_animated.dart';
import 'package:bbs/application/constants/constants.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/resources/time_duration/duration_manager.dart';
import 'package:bbs/presentation/view/home/widgets/utils.dart';
import 'package:bbs/presentation/view/shared_view/shared.dart';
import 'package:bbs/presentation/view_model/transfer/transfer_data_cubit/fetch_transfer_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/service_setup_locator/dependancy_injection.dart';
import '../../../data/repository/transfer_repo.dart';
import '../../../domain/usecases/transfer_usecases/fetch_data.dart';

class TransferProcessActivity extends StatelessWidget {
  const TransferProcessActivity({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: ColorsManager.kWhiteColor,
          appBar: AppBar(
            title: const Text(AppConstants.kAllTransfers),
          ),
          body: BlocProvider(
            create: (context) => FetchTransferDataCubit(
              FetchTransferDataUseCase(
                locatorService.get<TransferRepositoryImpl>(),
              ),
            )..fetchTransferData(),
            child: BlocBuilder<FetchTransferDataCubit, FetchTransferDataState>(
              builder: (context, state) {
                if (state is FetchTransferDataSuccess) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: AnimatedListTransferBuilder(
                            transferProcessList: state.transferProcessModel),
                      ),
                    ],
                  );
                } else if (state is FetchTransferDataFailed) {
                  return const Center(
                    child: Text(
                      'Cannot Fetch Data Try Again Later',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
      );
}

class AnimatedListTransferBuilder extends StatelessWidget {
  const AnimatedListTransferBuilder(
      {super.key, required this.transferProcessList});

  final List<TransferProcessModel> transferProcessList;

  @override
  Widget build(BuildContext context) => LiveList(
        physics: const BouncingScrollPhysics(),
        showItemInterval:
            Duration(milliseconds: TimeIntervalDurationManager.t150.toInt()),
        showItemDuration:
            Duration(milliseconds: TimeIntervalDurationManager.t350.toInt()),
        padding: const EdgeInsets.all(SpacePaddingManager.p8),
        reAnimateOnVisibility: true,
        scrollDirection: Axis.vertical,
        itemCount: transferProcessList.length,
        itemBuilder: animationItemBuilder(
          (index) => TransferCardView(
              index: index, transferDataList: transferProcessList),
          padding: const EdgeInsets.symmetric(vertical: SpacePaddingManager.p8),
        ),
      );
}
