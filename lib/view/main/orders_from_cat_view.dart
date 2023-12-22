import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/order/get_orders_from_cat.dart';

class OrdersFromCatView extends StatelessWidget {
  final category;
  const OrdersFromCatView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final ordersModel = context.read<GetOrdersFromCategory>();
    ordersModel.getOrdersFromCategory(category);
    return  WillPopScope(
        onWillPop: () {
      Navigator.pop(context);
     ordersModel.clearList();
      return Future.value(false);
    },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(249, 249,249, 1),
        appBar: AppBar(
          title: Text(category),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(ordersModel.orders.length, (index) => Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ordersModel.orders[index].name),
                          const SizedBox(height: 8,),
                          const Text('Начать сегодня',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xffCBCBCB),
                          ),),
                          const SizedBox(height: 3,),
                          const Text('Адрес',   style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xffCBCBCB),
                          ),),
                          Text('${ordersModel.orders[index].price_min}-${ordersModel.orders[index].price_max} €',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),)
                        ],
                      ),
                    ),
                  )),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
      ),
    );
  }
}
