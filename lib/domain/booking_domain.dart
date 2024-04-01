import 'package:dio/dio.dart';
import 'package:untitled1/server_routes.dart';

class BookingDomain  {
  Dio dio = Dio();
  Future<void> createBooking({
    required description,
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
    dio.post('${ServerRoutes.host}/createbooking',
    data: {
      'sid': sid,
      'cid': cid,
      'uid':uid,
      'description': description,
      'owner_name': owner_name,
      'owner_email': owner_email,
      'owner_phone': owner_phone,
      'pickup': pickup,
      'delivery': delivery,
      'timestamp': timestamp,
      'date_time': date_time,
    });
  }
  Future<void> createBookingOffer({
    required sid,
    required cid,
    required uid,
    required owner_name,
    required owner_email,
    required owner_phone,
    required description,
    required pickup,
    required delivery,
    required timestamp,
    required date_time,
    required garage,
  }) async {
    dio.post('${ServerRoutes.host}/createBookingOffer',
        data: {
          'sid': sid,
          'cid': cid,
          'uid':uid,
          'description': description,
          'owner_name': owner_name,
          'owner_email': owner_email,
          'owner_phone': owner_phone,
          'pickup': pickup,
          'delivery': delivery,
          'timestamp': timestamp,
          'date_time': date_time,
          'garage': garage,
        });
  }
}