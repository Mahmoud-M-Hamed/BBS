import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/view/transfer/widgets/transfer_card_view.dart';
import 'package:flutter/material.dart';
import 'list_tile.dart';

class VerticalItem extends StatelessWidget {
  const VerticalItem(
      {Key? key, required this.customerDataList, required this.index})
      : super(key: key);
  final List<CustomerEntity> customerDataList;
  final int index;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: SpaceEmptyManager.s100,
        child: Card(
            elevation: 10,
            child: HomeListTileBuilder(
              customerDataList: customerDataList,
              index: index,
            )),
      );
}

class TransferCardView extends StatelessWidget {
  const TransferCardView(
      {super.key, required this.transferDataList, required this.index});

  final List<TransferProcessModel> transferDataList;
  final int index;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: SpaceEmptyManager.s100,
        child: Card(
          elevation: 10,
          color: ColorsManager.kPrimaryColor,
          child: TransferCardViewDetails(
              index: index, transferDataList: transferDataList),
        ),
      );
}
