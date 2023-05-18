import 'package:auto_animated/auto_animated.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/time_duration/duration_manager.dart';
import 'package:bbs/presentation/view/home/widgets/utils.dart';
import 'package:bbs/presentation/view/shared_view/shared.dart';
import 'package:bbs/presentation/view_model/customer/customer_data_cubit/fetch_customer_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListViewBuilder extends StatelessWidget {
  const HomeListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FetchCustomerDataCubit, FetchCustomerDataState>(
        builder: (context, state) {
          if (state is FetchCustomerDataSuccess) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: AnimatedListBuilder(
                      customerDataList: state.customerEntityList),
                ),
              ],
            );
          } else if (state is FetchCustomerDataFailed) {
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
      );
}

class AnimatedListBuilder extends StatelessWidget {
  const AnimatedListBuilder({super.key, required this.customerDataList});

  final List<CustomerEntity> customerDataList;

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
        itemCount: customerDataList.length,
        itemBuilder: animationItemBuilder(
          (index) =>
              VerticalItem(customerDataList: customerDataList, index: index),
          padding: const EdgeInsets.symmetric(vertical: SpacePaddingManager.p8),
        ),
      );
}
