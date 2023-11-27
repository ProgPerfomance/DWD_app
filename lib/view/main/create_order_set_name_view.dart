import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/create_order.dart';
import 'package:untitled1/view/main/home_view.dart';
import 'package:untitled1/view/widgets/custom_textfield_widget.dart';
import 'package:untitled1/view/widgets/top_row_widget.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class CreateOrderSetNameAndEmailView extends StatefulWidget {
  final String name;
  const CreateOrderSetNameAndEmailView({super.key, required this.name});

  @override
  State<CreateOrderSetNameAndEmailView> createState() => _CreateOrderSetNameViewState();
}

class _CreateOrderSetNameViewState extends State<CreateOrderSetNameAndEmailView> {
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
             TopRowWidget(text: 'Шаг 6 из 6'),
              const SizedBox(
                height: 16,
              ),
              Text(widget.name, style: const TextStyle(
                fontSize: 12,
                color: Color(0xff808080),
              ),),
              const Text('Заказ почти готов', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),),
              const SizedBox(height: 10,),
              CustomTextFieldWidget(controller: _nameController, text: 'Введите имя', password: false),
            const SizedBox(height: 10,),
              CustomTextFieldWidget(controller: _emailController, text: 'Введите email', password: false),
              SizedBox(height: MediaQuery.of(context).size.height / 1.8,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: GestureDetector(
                  onTap: () {
                    _emailController.text.isEmpty || _nameController.text.length< 1 ? null : {
                      watchModel.create(),
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()))};


                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _emailController.text.isEmpty || _nameController.text.isEmpty ? const Color(0xffEBEBEB) : const Color(0xffF14F44),
                    ),
                    child: Center(
                      child: Text('Продолжить', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: _emailController.text.isEmpty || _nameController.text.length <1 ? Colors.black : Colors.white,
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
