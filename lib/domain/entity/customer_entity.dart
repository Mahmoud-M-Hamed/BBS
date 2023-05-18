class CustomerEntity {
  final int id;
  final String name;
  final String email;
  final double currentBalance;

  CustomerEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.currentBalance});
}
