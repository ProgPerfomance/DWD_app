import 'package:dio/dio.dart';
import 'package:untitled1/ServerRoutes.dart';

void addOrderSee(id) async {
  Dio dio = Dio();
final response = await  dio.post('${ServerRoutes.host}/addseeorder',
data: {
  'id': id.toString(),
});
print(response.data);
}