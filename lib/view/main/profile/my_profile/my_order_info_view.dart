import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/order/get_orders_list.dart';
import 'package:untitled1/domain/user/get_user_profile.dart';
import 'package:untitled1/model/user_model.dart';

class MyOrderInfoView extends StatelessWidget {
  final id;
  const MyOrderInfoView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final orderModel = context.watch<GetOrdersList>().myOrders[id];
    final freelancerModel = context.read<GetUserProfile>();
    var users;
    Future.delayed(const Duration(milliseconds: 1), () async {
      users =  List.generate(orderModel.responses.length, (index) async {
      var user =  await freelancerModel.getOtherUserProfile(orderModel.responses[index].uid);
        return {
          'name': user.name,
          'uid':  orderModel.responses[index].uid,
          'rating': user.rating,
        };
      });
    });
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Image.asset('assets/design/images/arrowleft.png'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Моя заявка',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Открыта'),
                    Row(
                      children: [
                         Text(
                          '${orderModel.sees}',
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffCBCBCB)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset('assets/design/images/eye.png'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                 Text(
                  orderModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 54,
                    decoration: BoxDecoration(
                        color: const Color(0xffEBEBEB),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xffEBEBEB), width: 3)),
                    child: Row(
                      children: [
                        Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width / 2 - 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffffffff),
                          ),
                          child: const Center(
                            child: Text('Отклики'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width / 2 - 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffEBEBEB),
                          ),
                          child: const Center(
                            child: Text('Специалисты'),
                          ),
                        ),
                      ],
                    )),
                orderModel.responses.isEmpty
                    ? SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 130.0),
                          child: Column(
                            children: [
                              Center(
                                  child: Image.asset(
                                      'assets/design/images/Chat.png')),
                              const SizedBox(
                                height: 22,
                              ),
                              const Text(
                                'Подождите откликов от специалистов',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Или напишите им сами',
                                    style: TextStyle(
                                      color: Color(0xff808080),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                        children:
                            List.generate(orderModel.responses.length, (index) {
                          UserModel? user;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffffffff),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(users.toString()),
                                    Text(orderModel.responses[index].comment),
                                    Text('Предложенная цена: ${orderModel.responses[index].price}\$'),
                                    Text('Дата начала работ: ${orderModel.responses[index].date_and_time}')
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      )),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Container(
          height: 57,
          width: MediaQuery.of(context).size.width -40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red,
          ),
          child: const Center(child: Text('Завершить заказ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),)),
        ),
      ),
    );
  }
}
