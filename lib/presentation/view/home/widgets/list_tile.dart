import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/resources/styles/icons/broken_icons.dart';
import 'package:bbs/presentation/view/info_details/details.dart';
import 'package:bbs/presentation/view/transfer/widgets/transfer_Dialog.dart';
import 'package:flutter/material.dart';

class HomeListTileBuilder extends StatelessWidget {
  const HomeListTileBuilder(
      {Key? key, required this.customerDataList, required this.index})
      : super(key: key);
  final List<CustomerEntity> customerDataList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => InfoDetailsActivity(
                userId: customerDataList[index].id,
                currentBalance: customerDataList[index].currentBalance,
                userName: customerDataList[index].name,
                userEmail: customerDataList[index].email,
                index: index));
      },
      contentPadding: const EdgeInsets.all(SpacePaddingManager.p10),
      splashColor: ColorsManager.kBlueAccent,
      leading: const Icon(
        BrokenIcons.user_1,
        size: 35,
        color: ColorsManager.kPrimaryColor,
      ),
      trailing: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => TransferProcessDialog(
                  index: index, customerList: customerDataList));
        },
        child: Text(
          'Transfer',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(letterSpacing: 0.5),
        ),
      ),
      title: Text(
        customerDataList[index].name,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      subtitle: Text(customerDataList[index].email,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.grey[600])),
    );
  }
}
