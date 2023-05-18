import 'package:bbs/application/extensions/extensions.dart';
import 'package:bbs/data/models/transfer_process_model.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/resources/styles/icons/broken_icons.dart';
import 'package:flutter/material.dart';

class TransferCardViewDetails extends StatelessWidget {
  const TransferCardViewDetails(
      {super.key, required this.transferDataList, required this.index});

  final List<TransferProcessModel> transferDataList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            20.ph,
            Text(
              transferDataList[index].senderName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 12),
            ),
            Text(
              'Current Balance',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${transferDataList[index].senderBalance} \$',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Column(
          children: [
            15.ph,
            Text(
              '${transferDataList[index].amountOfMoney}\$',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: ColorsManager.kAnimationTitleColor),
            ),
            const Icon(
              BrokenIcons.transfer_alt,
              size: 40,
              color: ColorsManager.kWhiteColor,
            ),
          ],
        ),
        Column(
          children: [
            20.ph,
            Text(
              transferDataList[index].receiverName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 12),
            ),
            Text(
              'Current Balance',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${transferDataList[index].receiverBalance} \$',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
