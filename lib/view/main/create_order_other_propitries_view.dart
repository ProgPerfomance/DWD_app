import 'package:flutter/material.dart';

import '../widgets/top_row_widget.dart';
import 'create_order_set_name_view.dart';

TextEditingController textEditingController = TextEditingController();

class CreateOrderOtherPropiretiesView extends StatefulWidget {
  final name;
  const CreateOrderOtherPropiretiesView({super.key, required this.name});

  @override
  State<CreateOrderOtherPropiretiesView> createState() => _CreateOrderOtherPropiretiesViewState();
}

class _CreateOrderOtherPropiretiesViewState extends State<CreateOrderOtherPropiretiesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopRowWidget(text: 'Шаг 5 из 6'),
              const SizedBox(
                height: 16,
              ),
              Text(widget.name, style: const TextStyle(
                fontSize: 12,
                color: Color(0xff808080),
              ),),
              const Text('Остались пожелания к\nзаказу?', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),),
              const SizedBox(height: 10,),
              SizedBox(
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 30),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xFFCBCBCB,
                      ),
                    ),
                    hintText: '  Напишите важные детали для специалиста',
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
              const SizedBox(height: 30,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.asset('assets/design/images/img.png'),
                Image.asset('assets/design/images/img.png'),
                Image.asset('assets/design/images/img.png'),
              ],),
              SizedBox(height: MediaQuery.of(context).size.height / 2.83,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetNameAndEmailView(name: widget.name,)));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(
                      child: Text('Продолжить', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
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
