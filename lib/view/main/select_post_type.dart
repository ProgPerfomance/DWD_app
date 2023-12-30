import 'package:flutter/material.dart';
import 'package:untitled1/view/main/ads/create_adverb/create_adverb_select_category_view.dart';

import 'create_order/create_order_select_category.dart';

class SelectPostType extends StatelessWidget {
  const SelectPostType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateOrderSelectCategory()));
                },
                child: Container(
                  height: 57,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      'Создать заявку',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAdverbSelectCategoryView()));
                },
                child: Container(
                  height: 57,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      'Создать объявление',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                        color: Colors.white,
                      ),
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
