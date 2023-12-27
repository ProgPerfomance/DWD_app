import 'package:flutter/material.dart';
import 'package:untitled1/data/adverb_categories_data.dart';
import 'package:untitled1/model/adverb_category_model.dart';

class CreateAdverbSelectCategoryView extends StatelessWidget {
  const CreateAdverbSelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Объявление о продаже/покупке',
        style: TextStyle(
          fontSize: 15,
        ),),
         centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index) {
          AdverbCategoryModel item = adsCategories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),),
                    item.pods.isNotEmpty ?
                    Image.asset('assets/design/images/arrowright.png') : SizedBox(),
                  ],
                ),
                SizedBox(height: 12,),
                Divider(),
                SizedBox(height: 12,),
              ],
            ),
          );
        },
        itemCount: adsCategories.length,),


      ),
    );
  }
}
