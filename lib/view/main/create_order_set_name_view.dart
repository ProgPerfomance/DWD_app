import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/create_order.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';
import 'package:untitled1/view/main/home_view.dart';
import 'package:untitled1/view/widgets/custom_textfield_widget.dart';
import 'package:untitled1/view/widgets/top_row_widget.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class CreateOrderSetNameAndEmailView extends StatefulWidget {
  final String categoryName;
  final String orderName;
  final String dateAndTime;
  final String address;
  final String priceMin;
  final String priceMax;
  final String sup;
  const CreateOrderSetNameAndEmailView(
      {super.key,
      required this.categoryName,
      required this.address,
      required this.dateAndTime,
      required this.orderName,
      required this.priceMin,
      required this.priceMax,
      required this.sup});

  @override
  State<CreateOrderSetNameAndEmailView> createState() =>
      _CreateOrderSetNameViewState();
}

class _CreateOrderSetNameViewState
    extends State<CreateOrderSetNameAndEmailView> {
  @override
  Widget build(BuildContext context) {
    final createOrder = context.watch<CreateOrder>();
    final userModel = context.watch<CreateUser>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopRowWidget(text: 'Шаг 6 из 6'),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.categoryName,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff808080),
                ),
              ),
              const Text(
                'Заказ почти готов',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFieldWidget(
                  controller: _nameController,
                  text: 'Введите имя',
                  password: false),
              const SizedBox(
                height: 10,
              ),
              CustomTextFieldWidget(
                  controller: _emailController,
                  text: 'Введите email',
                  password: false),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: GestureDetector(
                  onTap: () {
                    _emailController.text.isEmpty ||
                            _nameController.text.isEmpty
                        ? null
                        : {
                            createOrder.createOrder(
                                uid: int.parse(userModel.uid),
                                name: widget.orderName,
                                timestamp: DateTime.now().toString(),
                                category: widget.categoryName,
                                category_sup: '',
                                date_and_time: widget.dateAndTime,
                                geo_x: 1,
                                geo_y: 1,
                                geo_del_x: 0,
                                geo_del_y: 0,
                                price_min: int.parse(widget.priceMin),
                                price_max: int.parse(widget.priceMax),
                                wishes: widget.sup,
                                img1: '',
                                img2: '',
                                img3: '',
                                img4: '',
                                img5: '',
                                img6: '',
                                img7: '',
                                img8: '',
                                img9: '',
                                img10: '',
                                username: _nameController.text,
                                order_status: 'active',
                                email: _emailController.text,
                                city: 'Moscow',
                                remotely: false),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()))
                          };
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _emailController.text.isEmpty ||
                              _nameController.text.isEmpty
                          ? const Color(0xffEBEBEB)
                          : const Color(0xffF14F44),
                    ),
                    child: Center(
                      child: Text('Продолжить',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: _emailController.text.isEmpty ||
                                    _nameController.text.isEmpty
                                ? Colors.black
                                : Colors.white,
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
