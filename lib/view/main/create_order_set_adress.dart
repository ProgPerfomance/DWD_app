import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/create_order.dart';
import 'package:untitled1/view/main/create_order_set_price_view.dart';

import '../widgets/custom_textfield_widget.dart';
import '../widgets/top_row_widget.dart';

TextEditingController addressController = TextEditingController();

class CreateOrderSetAdressView extends StatefulWidget {
  final String name;
  const CreateOrderSetAdressView({super.key, required this.name});

  @override
  State<CreateOrderSetAdressView> createState() => _CreateOrderSetAdressViewState();
}

class _CreateOrderSetAdressViewState extends State<CreateOrderSetAdressView> {
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
              TopRowWidget(text: 'Шаг 3 из 6'),
              const SizedBox(
                height: 16,
              ),
              Text(widget.name, style: const TextStyle(
                fontSize: 12,
                color: Color(0xff808080),
              ),),
              const Text('Где нужно?', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),),
              const SizedBox(height: 30,),
              CustomTextFieldWidget(controller: addressController, text: 'Город, дом, улица', password: false),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff808080)),
                      borderRadius: BorderRadius.circular(120),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const Text('Можно выполнить удалённо', style: TextStyle(
                    color: Color(0xff808080),fontSize: 16,
                  ),),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 2,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: GestureDetector(
                  onTap: () {
                    watchModel.setAdress(addressController.text);
                    addressController.text.length < 1 ? null :  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetPriceView(name: widget.name)));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: addressController.text.length < 1 ? const Color(0xffEBEBEB) : const Color(0xffF14F44),
                    ),
                    child: Center(
                      child: Text('Продолжить', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: addressController.text.length < 1 ? Colors.black : Colors.white,
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
