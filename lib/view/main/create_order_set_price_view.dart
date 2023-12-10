import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/main/create_order_other_propitries_view.dart';
import 'package:untitled1/view/widgets/top_row_widget.dart';

import '../../domain/create_order.dart';

TextEditingController minPriceController = TextEditingController();
TextEditingController maxPriceController =TextEditingController();
class CreateOrderSetPriceView extends StatefulWidget {
  final String categoryName;
  final String orderName;
  final String dateAndTime;
  final String address;
  const CreateOrderSetPriceView({super.key, required this.orderName, required this.categoryName, required this.dateAndTime, required this.address});

  @override
  State<CreateOrderSetPriceView> createState() => _CreateOrderSetPriceViewState();
}

class _CreateOrderSetPriceViewState extends State<CreateOrderSetPriceView> {
  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<CreateOrder>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const TopRowWidget(text: 'Шаг 4 из 6',),
              const SizedBox(
                height: 16,
              ),
              Text(widget.categoryName, style: const TextStyle(
                fontSize: 12,
                color: Color(0xff808080),
              ),),
              const Text('Сколько готовы заплатить?', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 26,
                  child: TextField(
                    controller: minPriceController,
                    decoration: InputDecoration(

                      hintStyle: const TextStyle(
                        color: Color(
                          0xFFCBCBCB,
                        ),
                      ),
                     hintText: 'От €',
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
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width /2 - 26,
                  child: TextField(
                    controller: maxPriceController,
                    decoration: InputDecoration(

                      hintStyle: const TextStyle(
                        color: Color(
                          0xFFCBCBCB,
                        ),
                      ),
                       hintText: 'До €',
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
                    ),
                  ),
                ),
              ],),
              SizedBox(height: MediaQuery.of(context).size.height / 1.7,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: GestureDetector(
                  onTap: () {
                    minPriceController.text.isEmpty || maxPriceController.text.isEmpty ? null :  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderOtherPropiretiesView(categoryName: widget.categoryName, orderName: widget.orderName, priceMax: maxPriceController.text, dateAndTime: widget.dateAndTime, address: widget.address,priceMin: minPriceController.text,)));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: minPriceController.text.isEmpty || maxPriceController.text.isEmpty ? const Color(0xffEBEBEB) : const Color(0xffF14F44),
                    ),
                    child: Center(
                      child: Text('Продолжить', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: minPriceController.text.isEmpty || maxPriceController.text.isEmpty ? Colors.black : Colors.white,
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
