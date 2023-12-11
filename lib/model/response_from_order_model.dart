class ResponseFromOrderModel {
  final id;
  final pid;
  final uid;
  final price;
  final comment;
  final date_and_time;
  final timestamp;
  ResponseFromOrderModel(
      {required this.pid,
      required this.id,
      required this.price,
      required this.uid,
      required this.timestamp,
      required this.date_and_time,
      required this.comment});
}
