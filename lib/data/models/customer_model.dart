import 'package:bbs/data/models/model_local_strings.dart';

class CustomerModel {
  final int id;
  final String name;
  final String email;
  final double currentBalance;

  CustomerModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.currentBalance});

  static final List<CustomerModel> customerInfoList = [];

  static List<CustomerModel> get customerInfo => _addCustomerObjectToList();

  static List<CustomerModel> _addCustomerObjectToList() {
    for (int i = 0; i < ConstantsStringModel.idsList.length; i++) {
      customerInfoList.add(
        CustomerModel(
          id: ConstantsStringModel.idsList[i],
          name: ConstantsStringModel.namesList[i],
          email: ConstantsStringModel.emailsList[i],
          currentBalance: ConstantsStringModel.balanceList[i],
        ),
      );
    }

    return customerInfoList;
  }
}
