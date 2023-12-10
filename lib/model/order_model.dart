class OrderModel {
  final name;
  final uid;
  final id;
  final category;
  final price_min;
  final price_max;
  final wishes;
  final username;
  final email;
  final orderStatus;
  final sees;
  final remotely;
  final city;
  OrderModel(
      {required this.uid,
      required this.remotely,
      required this.email,
      required this.username,
      required this.wishes,
      required this.price_max,
      required this.price_min,
      required this.category,
      required this.name,
      required this.id,
      required this.orderStatus,
        required this.city,
      required this.sees});
  @override
  String toString() {
    // TODO: implement toString
    return '$uid, $remotely, $email, $username, $wishes, $price_min, $price_max, $category, $name, $id, $orderStatus, $sees';
  }
}
