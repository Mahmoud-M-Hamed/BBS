import 'package:bbs/application/extensions/extensions.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/service_setup_locator/dependancy_injection.dart';
import '../../../data/repository/repository.dart';
import '../../../domain/usecases/customer_usecases/fetch_customer_data.dart';
import '../../view_model/customer/customer_data_cubit/fetch_customer_data_cubit.dart';

class InfoDetailsActivity extends StatelessWidget {
  const InfoDetailsActivity(
      {Key? key,
      this.userId,
      this.currentBalance,
      this.userName,
      this.userEmail,
      this.index})
      : super(key: key);
  final int? userId;
  final num? currentBalance;
  final String? userName;
  final String? userEmail;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCustomerDataCubit(
        FetchCustomerDataUseCase(
          locatorService.get<RepositoryImpl>(),
        ),
      )..fetchCustomerData(),
      child: BlocBuilder<FetchCustomerDataCubit, FetchCustomerDataState>(
        builder: (context, state) {
          List<String>? userDetails = [
            'User ID: ${userId.orNull()}',
            'User Name: \n${userName.orNull()}',
            'User Email: \n${userEmail.orNull()}',
            'Current Balance: \n${(state is FetchCustomerDataSuccess) ? state.customerEntityList[index!].currentBalance : currentBalance} \$'
          ];
          return (state is FetchCustomerDataLoading)
              ? const Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.white),
                )
              : AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SpacePaddingManager.p22),
                  ),
                  content: SizedBox(
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userInfoTitle(context),
                        40.ph,
                        ...List.generate(
                            userDetails.length,
                            (index) => Column(
                                  children: [
                                    userInfoTextDialog(
                                        context, userDetails, index),
                                    10.ph,
                                  ],
                                )),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget userInfoTextDialog(
          BuildContext context, List<String> userDetails, int index) =>
      Text(
        userDetails[index],
        style: Theme.of(context).textTheme.labelMedium,
      );

  Widget userInfoTitle(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_outline,
            color: ColorsManager.kBlueAccent,
            size: 30,
          ),
          5.pw,
          Text(
            'User Info',
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      );
}
