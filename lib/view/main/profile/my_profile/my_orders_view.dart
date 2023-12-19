import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/order/get_orders_list.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';
import 'package:untitled1/view/main/profile/my_profile/my_order_info_view.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final orderModel = context.read<GetOrdersList>();
    final userModel = context.watch<CreateUser>();
    orderModel.getMyOrders(int.parse(userModel.uid));
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
                    GestureDetector(child: Image.asset('assets/design/images/arrowleft.png'),onTap: () {
                      Navigator.pop(context);
                    },),
                    const Text(
                      'Мои заявки',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 13,),
                  ],
                ),
                const SizedBox(height: 25,),
                Container(
                    width: MediaQuery.of(context).size.width * 0.89,
                    height: 41,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12)),
                    child: MaterialButton(
                      onPressed: () {
                      },
                      child: const TextField(
                       // controller: controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Поиск",
                            prefixIcon: Icon(Icons.search),
                            prefixStyle: TextStyle(color: Colors.grey)),
                      ),
                    )),
                const SizedBox(height: 16,),
                const Text('Мои заявки',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333),
                ),),
                const SizedBox(height: 12,),
                Column(
                  children: List.generate(orderModel.myOrders.length, (index) {
                    var item = orderModel.myOrders[index];
                    return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyOrderInfoView(id: index,)));
                      },
                      child: Container(
                        //height: 106,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xffFFFFFF)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(item.name, style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),),
                              const SizedBox(height: 8,),
                              Text(item.name, style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffCBCBCB),
                              ),),
                              const SizedBox(height: 4,),
                               Text(item.city, style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffCBCBCB),
                              ),),
                              const SizedBox(height: 8,),
                              Row(
                                children: [
                                   Text('${item.price_min}-${item.price_max}\$',style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                                  const SizedBox(width: 12,),
                                  Image.asset('assets/design/images/card.png'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
