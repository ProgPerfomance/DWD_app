import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/car_controller.dart';
import 'package:untitled1/controller/chat_controller.dart';
import 'package:untitled1/controller/services_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/meneger_view/manager_booking/manager_open_booking.dart';
import 'package:untitled1/view/buy_car/car_page_view.dart';
import '../../server_routes.dart';

TextEditingController messageController = TextEditingController();

class ChatView extends GetView<ChatController> {
  final String chatId;
  final String? type;
  final opponentName;
  final String? message;
  final String? carId;
  final String? carIndex;
  final sid;
  final uidOpponent;
  const ChatView(
      {super.key,
      required this.chatId,
        required this.sid,
      required this.opponentName,
      this.message,
      required this.carId,
      required this.uidOpponent,
      required this.carIndex,
      required this.type});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    final carController = Get.put(CarController());
    Map data = {};
    Future.delayed(const Duration(milliseconds: 10), () async {
      if (type == 'car') {
        data = await carController.getCarInfo(carIndex);
      } else if (type == 'booking') {
        data = await ServicesController().getBookingInfo(sid);
      }
    });
    controller.getChatMessages(chatId);
    message != null ? messageController.text = message! : '';
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: Text(
          opponentName,
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Color(0xffffffff)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                type == 'car'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarPageView(
                                cash: data['cash'].toString(),
                                transmission: data['transmission'].toString(),
                                steeringWheel:
                                    data['steering_whell'].toString(),
                                state: data['state'].toString(),
                                serviceContract:
                                    data['service_contact'].toString(),
                                regionalSpecs:
                                    data['regional_specs'].toString(),
                                motorsTrim: data['motor_trim'].toString(),
                                kilometrs: data['killometers'].toString(),
                                guarantee: data['guarantee'].toString(),
                                color: data['color'].toString(),
                                priceAed: data['price_aed'].toString(),
                                priceUsd: data['price_usd'].toString(),
                                body: data['body'].toString(),
                                name: data['name'].toString(),
                                year: data['year'].toString(),
                                ccid: data['ccid'].toString(),
                                id: data['id'].toString(),
                                images: data['images'],
                                description: data['description'].toString())),
                      )
                    : type == 'booking'
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManagerOpenBooking(
                                    garageName: data['garage_name'],
                                    manager: false,
                                    carName: data['car_name'],
                                    description: data['description'],
                                    userEmail: data['owner_email'],
                                    userName: data['owner_name'],
                                    userPhone: data['owner_phone'],
                                    delivery: data['delivery'],
                                    pickUp: data['pick_up'],
                                    id: data['id'],
                                    garage: data['garage'],
                                    status: data['status'],
                                    carBrand: data['car_brand'],
                                    carModel: data['car_model'],
                                    carYear: data['car_year'],
                                    carReg: data['car_reg'],
                                    dateTime: data['date_time'])))
                        : null;
              },
              child: Stack(
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
                      // AssetImage('assets/dwd_logo.jpeg'),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0),
                      radius: 25,
                      backgroundImage: carId == null
                          ? NetworkImage(
                              '${ServerRoutes.host}/avatar?path=avatar_$uidOpponent')
                          : NetworkImage(
                              '${ServerRoutes.host}/test_photo?path=$carId'),
                      // AssetImage('assets/dwd_logo.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Obx(() => Column(
                    children:
                        List.generate(controller.messages.length, (index) {
                      final item = controller.messages[index];
                      return Align(
                        alignment: item['uid'] != userModel!.uid.toString()
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Padding(
                          padding: item['uid'] == userModel!.uid.toString()
                              ? EdgeInsets.only(
                                  right: 4.0,
                                  top: 3,
                                  bottom: 3,
                                  left: MediaQuery.of(context).size.width / 3.9)
                              : EdgeInsets.only(
                                  left: 4.0,
                                  top: 3,
                                  bottom: 3,
                                  right:
                                      MediaQuery.of(context).size.width / 3.9),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: item['uid'] != userModel!.uid.toString()
                                  ? const Color(0xff7253F6)
                                  : const Color(0xff252033),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                item['msg_text'].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff313132),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: messageController,
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    hintText: 'Describe the problem',
                    hintStyle: const TextStyle(
                      color: Color(0xff5D5D60),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        messageController.text.isNotEmpty
                            ? await controller.sendMessage(
                                cid: chatId,
                                uid: userModel!.uid,
                                msg: messageController.text)
                            : null;
                        messageController.clear();
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent + 130,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Color(0xff8875FF),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
