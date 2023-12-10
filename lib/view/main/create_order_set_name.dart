import 'package:flutter/material.dart';
import 'package:untitled1/view/main/create_order_set_time_view.dart';
import 'package:untitled1/view/widgets/custom_textfield_widget.dart';
import '../widgets/top_row_widget.dart';
TextEditingController nameController = TextEditingController();

class CreateOrderSetName extends StatefulWidget {
  final name;
  const CreateOrderSetName({super.key, required this.name});

  @override
  State<CreateOrderSetName> createState() => _CreateOrderSetNameState();
}

class _CreateOrderSetNameState extends State<CreateOrderSetName> {
  @override
  Widget build(BuildContext context) {
    //final watchModel = context.watch<CreateOrder>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopRowWidget(text: 'Название заявки'),
              const SizedBox(
                height: 16,
              ),
              Text(widget.name, style: const TextStyle(
                fontSize: 12,
                color: Color(0xff808080),
              ),),
              const Text('Как будет называться заявка?', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),),
              const SizedBox(height: 12,),
              CustomTextFieldWidget(controller: nameController, text: 'Введите название заявки', password: false),
              SizedBox(height: MediaQuery.of(context).size.height / 1.7,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: GestureDetector(
                  onTap: () {
                    nameController.text.isEmpty ? null :  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetTimeView(categoryName: widget.name, orderName: nameController.text,)));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: nameController.text.isEmpty ? const Color(0xffEBEBEB) : const Color(0xffF14F44),
                    ),
                    child: Center(
                      child: Text('Продолжить', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: nameController.text.isEmpty ? Colors.black : Colors.white,
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
