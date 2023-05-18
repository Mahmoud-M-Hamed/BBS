class TransferProcessModel {
  String? senderName;
  String? receiverName;
  double? senderBalance;
  double? receiverBalance;
  int? senderID;
  int? receiverID;
  double? amountOfMoney;

  TransferProcessModel(
      {this.senderID,
      this.receiverID,
      this.amountOfMoney,
      this.senderName,
      this.senderBalance,
      this.receiverName,
      this.receiverBalance});
}
