import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/chat/create_chat.dart';
import 'package:untitled1/domain/response_from_order.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';
import 'package:untitled1/view/main/home_view.dart';
import 'package:untitled1/view/widgets/custom_textfield_widget.dart';
import '../../domain/order/get_order_from_id.dart';
FocusNode _focusNode = FocusNode();
TextEditingController priceCo = TextEditingController();
TextEditingController dateCO = TextEditingController();
TextEditingController kom = TextEditingController();

class ResponseOrderView extends StatefulWidget {
  final id;
  final uid;
  final description;
  final orderStatus;
  final city;
  final address;
  final wishes;
  final sees;
  final name;
  final category;
  final freelancer;
  const ResponseOrderView(
      {super.key,
      required this.id,
        required this.freelancer,
        required this.uid,
      required this.name,
      required this.city,
      required this.sees,
      required this.orderStatus,
      required this.category,
      required this.wishes,
      required this.address,
      required this.description});

  @override
  State<ResponseOrderView> createState() => _ResponseOrderViewState();
}

class _ResponseOrderViewState extends State<ResponseOrderView> {
  @override
  Widget build(BuildContext context) {
    print(widget.freelancer);
    final testModel = context.read<GetOrderFromId>();
    testModel.getOrderFromId(widget.id);
    final userModel = context.watch<CreateUser>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/design/images/arrowleft.png')),
                  Text(
                    'Заявка номер ${widget.id}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.orderStatus,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff6FC727)),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.sees.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Image.asset('assets/design/images/eye.png')
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.city,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff333333)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xffEBEBEB),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Описание',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff808080),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        color: Color(0xff333333),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Пожелания',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff808080),
                      ),
                    ),
                    Text(
                      widget.wishes,
                      style: const TextStyle(
                        color: Color(0xff333333),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Пожелания',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff808080),
                      ),
                    ),
                    const Text(
                      'From development',
                      style: TextStyle(
                        color: Color(0xff333333),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
          widget.freelancer == '1' ?    BottonSh(
                uid2: widget.uid,
                id: widget.id,
                uid: userModel.uid,
              ) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottonSh extends StatefulWidget {
  final id;
  final uid;
  final uid2;
  const BottonSh({super.key, required this.id, required this.uid, required this.uid2});

  @override
  State<BottonSh> createState() => _BottonShState();
}

class _BottonShState extends State<BottonSh> {
  @override
  Widget build(BuildContext context) {
    final createModel = context.read<ResponseFromOrder>();
    final chatModel = context.read<CreateChat>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
            return GestureDetector(
              onTap: () {
                _focusNode.unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 200,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                    'assets/design/images/arrowleft.png')),
                            const Text(
                              'Откикнуться',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 26),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Стоимость работ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        CustomTextFieldWidget(
                            controller: priceCo, text: '10 \$', password: false),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Дата и время выполнения',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                    GestureDetector(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          pickerMode: DateTimePickerMode.datetime,
                          initialDateTime:
                          DateTime.now().add(const Duration(days: 1)),
                          minDateTime: DateTime.now(),
                          maxDateTime: DateTime.now().add(const Duration(days: 365)),
                          locale: DateTimePickerLocale.en_us,
                          dateFormat: "dd MMMM yyyy HH:mm",
                          onChange: (dateTime, selectedIndex) {
                            dateCO.text = dateTime.toString();
                            setState(() {
                            });
                          },
                          onConfirm: (dateTime, selectedIndex) {
                            dateCO.text = dateTime.toString();
                            //    deliveryDate = dateTime;
                            //    date =
                            //     '${dateTime.year}-${add0(dateTime.month)}-${add0(dateTime.day)} ${add0(dateTime.hour)}:${add0(dateTime.minute)}:${add0(dateTime.second)}';
                          },
                        );
                      },
                      child: TextField(

                        controller: dateCO,
                        decoration: InputDecoration(
                          enabled: false,
                          hintStyle: const TextStyle(
                            color: Color(
                              0xFFCBCBCB,
                            ),
                          ),
                          hintText: 'Дата и время',
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                      ),),
                    ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Комментарий к отклику',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        TextField(
                          focusNode: _focusNode,
                          maxLines: 10,
                          minLines: 5,
                          maxLength: 1000,
                          controller: kom,
                          decoration: InputDecoration(

                            hintStyle: const TextStyle(
                              color: Color(
                                0xFFCBCBCB,
                              ),
                            ),
                            hintText: 'Напишите важные детали для специалиста',
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            chatModel.createChat(uid1: widget.uid, uid2: widget.uid2, pid: widget.id);
                            createModel.responseFromOrder(uid: int.parse(widget.uid), pid: widget.id, date_and_time: dateCO.text,timestamp: DateTime.now().toString(), price: int.parse(priceCo.text), comment: kom.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          child: Container(
                            height: 52,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xffF14F44),
                            ),
                            child: const Center(
                              child: Text(
                                'Подтвердить',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, backgroundColor: Colors.black.withOpacity(0.5));
        },
        child: Container(
          height: 52,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffF14F44),
          ),
          child: const Center(
            child: Text(
              'Откликнуться',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
