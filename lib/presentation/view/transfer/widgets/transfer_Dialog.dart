import 'package:bbs/application/extensions/extensions.dart';
import 'package:bbs/domain/entity/customer_entity.dart';
import 'package:bbs/presentation/resources/spaces/spaces.dart';
import 'package:bbs/presentation/resources/styles/colors/colors_manager.dart';
import 'package:bbs/presentation/view/transfer/transfer.dart';
import 'package:bbs/presentation/view_model/transfer/transfer_UI_changes_cubit/transfer_ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/transfer/transfer_database_cubit/transfer_database_cubit.dart';

class TransferProcessDialog extends StatefulWidget {
  const TransferProcessDialog(
      {required this.index, Key? key, required this.customerList})
      : super(key: key);
  final int index;
  final List<CustomerEntity> customerList;

  @override
  State<TransferProcessDialog> createState() => _TransferProcessDialogState();
}

class _TransferProcessDialogState extends State<TransferProcessDialog> {
  TextEditingController idFromController = TextEditingController();
  TextEditingController moneyTransferController = TextEditingController();
  String? senderName;
  double? senderBalance;
  String? receiverName;
  double? receiverBalance;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferDatabaseCubit, TransferDatabaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SpacePaddingManager.p22),
          ),
          content: SizedBox(
            height: 370,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  40.ph,
                  Text(
                    'Transfer Process',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: ColorsManager.kBlueAccent),
                  ),
                  20.ph,
                  TextFormField(
                    controller: idFromController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.all(SpacePaddingManager.p14),
                      labelText: 'From User ID',
                      labelStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.grey[600],
                                letterSpacing: -0.2,
                                wordSpacing: -1,
                              ),
                      hintText: 'Enter User ID',
                      hintStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.grey[600],
                              ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SpacePaddingManager.p22),
                      ),
                    ),
                  ),
                  15.ph,
                  Text(
                    'Transfer To',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    'User ID: ${widget.customerList[widget.index].id}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  15.ph,
                  TextFormField(
                    controller: moneyTransferController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.all(SpacePaddingManager.p14),
                      labelText: 'Amount Of Money',
                      labelStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.grey[600],
                                letterSpacing: -0.2,
                                wordSpacing: -1,
                              ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SpacePaddingManager.p22),
                      ),
                    ),
                  ),
                  40.ph,
                  BlocProvider(
                    create: (context) => TransferUiCubit(),
                    child: BlocBuilder<TransferUiCubit, TransferUiState>(
                      builder: (context, state) => (TransferUiCubit.get(context)
                              .transferProcessSuccessful)
                          ? FilledButton.icon(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TransferProcessActivity(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green,
                                ),
                              ),
                              icon: const Icon(
                                Icons.done_all,
                                size: 18,
                              ),
                              label: Text(
                                'Done Successfully Check Info',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            )
                          : OutlinedButton(
                              onPressed: () {
                                widget.customerList.forEach((element) {
                                  if (idFromController.text ==
                                      element.id.toString()) {
                                    senderName = element.name;
                                    senderBalance = element.currentBalance;
                                  }
                                });
                                TransferDatabaseCubit.get(context)
                                    .insertTransferProcess(
                                        senderID: idFromController.text,
                                        senderName: senderName.orNull(),
                                        senderBalance: senderBalance!,
                                        receiverID: widget
                                            .customerList[widget.index].id
                                            .orNull(),
                                        receiverName: widget
                                            .customerList[widget.index].name
                                            .orNull(),
                                        receiverBalance: widget
                                            .customerList[widget.index]
                                            .currentBalance
                                            .orNull(),
                                        amountOfMoney:
                                            moneyTransferController.text)
                                    .whenComplete(() {
                                  TransferUiCubit.get(context)
                                      .transferSuccess();
                                });
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(horizontal: 50)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        SpacePaddingManager.p18),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Transfer',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
