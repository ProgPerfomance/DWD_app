import 'package:dio/dio.dart';

class BookingDomain  {
  Dio dio = Dio();
  Future<void> createBooking({
    required sid,
    required cid,
    required uid,
    required owner_name,
    required owner_email,
    required owner_phone,
    required pickup,
    required delivery,
    required timestamp,
    required date_time,
}) async {
    dio.post('http://63.251.122.116:2308/createbooking',
    data: {
      'sid': sid,
      'cid': cid,
      'uid':uid,
      'owner_name': owner_name,
      'owner_email': owner_email,
      'owner_phone': owner_phone,
      'pickup': pickup,
      'delivery': delivery,
      'timestamp': timestamp,
      'date_time': date_time,
    });
  }
}