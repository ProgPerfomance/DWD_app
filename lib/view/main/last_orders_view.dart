// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/order/add_order_see.dart';
import 'package:untitled1/view/main/response_order_view.dart';

import '../../domain/order/get_order_from_id.dart';
import '../../domain/order/get_orders_list.dart';
import '../../domain/user/get_user_profile.dart';

class LastOrdersView extends StatelessWidget {
  const LastOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<GetOrdersList>();
    final testModel = context.read<GetOrderFromId>();
    final profileModel = context.watch<GetUserProfile>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Все заявки'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:   SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: watchModel.orders.length,
            itemBuilder: (context, index) {
              final item = watchModel.orders[index];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      addOrderSee(item.id);
                      await testModel.getOrderFromId(index);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResponseOrderView(
                                freelancer: profileModel
                                    .userModel?.freelancer
                                    .toString(),
                                uid: item.uid,
                                id: int.parse(item.id),
                                name: item.name,
                                address: null,
                                city: item.city,
                                category: item.category,
                                sees: item.sees,
                                description: 'ffddfihd',
                                wishes: item.wishes,
                                orderStatus: item.orderStatus,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14)),
                      child: ListTile(
                        title: Text(
                          item.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                            "${item.price_min}-${item.price_max}"),
                        trailing: FittedBox(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.near_me,
                                color: Colors.grey,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                item.city,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
