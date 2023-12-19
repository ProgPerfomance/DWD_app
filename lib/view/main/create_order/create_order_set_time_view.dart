import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:untitled1/view/main/create_order/create_order_set_adress.dart';

import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/top_row_widget.dart';

TextEditingController timeController = TextEditingController();
class CreateOrderSetTimeView extends StatefulWidget {
  final categoryName;
  final orderName;
  const CreateOrderSetTimeView({super.key, required this.categoryName, required this.orderName});

  @override
  State<CreateOrderSetTimeView> createState() => _CreateOrderSetTimeViewState();
}

class _CreateOrderSetTimeViewState extends State<CreateOrderSetTimeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopRowWidget(text: 'Шаг 2 из 6'),
              const SizedBox(
                height: 16,
              ),
              Text(widget.categoryName, style: const TextStyle(
                fontSize: 12,
                color: Color(0xff808080),
              ),),
              const Text('Когда нужно?', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),),
              const SizedBox(height: 12,),
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
                    timeController.text = dateTime.toString();
                    setState(() {
                    });
                  },
                  onConfirm: (dateTime, selectedIndex) {
                    timeController.text = dateTime.toString();
                //    deliveryDate = dateTime;
                //    date =
               //     '${dateTime.year}-${add0(dateTime.month)}-${add0(dateTime.day)} ${add0(dateTime.hour)}:${add0(dateTime.minute)}:${add0(dateTime.second)}';
                  },
                );
              },
              child: TextField(
                controller: timeController,
                enabled: false,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    color: Color(
                      0xFFCBCBCB,
                    ),
                  ),
                  hintText: 'Дата',
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
              SizedBox(height: MediaQuery.of(context).size.height / 1.7,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: GestureDetector(
                  onTap: () {
                    timeController.text.length < 1 ? null :  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetAdressView(categoryName: widget.categoryName, dateAndTime: timeController.text, orderName: widget.orderName,)));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: timeController.text.length < 1 ? const Color(0xffEBEBEB) : const Color(0xffF14F44),
                    ),
                    child: Center(
                      child: Text('Продолжить', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: timeController.text.length < 1 ? Colors.black : Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  DatePicker.showDatePicker(
//                     context,
//                     pickerMode: DateTimePickerMode.datetime,
//                     initialDateTime:
//                         DateTime.now().add(const Duration(days: 1)),
//                     minDateTime: DateTime.now(),
//                     maxDateTime: DateTime.now().add(const Duration(days: 365)),
//                     locale: DateTimePickerLocale.ru,
//                     dateFormat: "dd MMMM yyyy HH:mm",
//                     onChange: (dateTime, selectedIndex) {
//                       deliveryDate = dateTime;
//                     },
//                     onConfirm: (dateTime, selectedIndex) {
//                       deliveryDate = dateTime;
//                       date =
//                           '${dateTime.year}-${add0(dateTime.month)}-${add0(dateTime.day)} ${add0(dateTime.hour)}:${add0(dateTime.minute)}:${add0(dateTime.second)}';
//                     },
//                   );