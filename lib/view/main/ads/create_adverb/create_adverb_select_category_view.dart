import 'package:flutter/material.dart';
import 'package:untitled1/data/adverb_categories_data.dart';
import 'package:untitled1/model/adverb_category_model.dart';
import 'package:untitled1/view/main/ads/create_adverb/create_adverb_set_name_view.dart';

class CreateAdverbSelectCategoryView extends StatelessWidget {
  const CreateAdverbSelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Объявление о продаже/покупке',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            AdverbCategoryModel item = adsCategories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CategoryCardWidget(empty: item.pods.isEmpty, item: item),
                ],
              ),
            );
          },
          itemCount: adsCategories.length,
        ),
      ),
    );
  }
}

class CategoryCardWidget extends StatelessWidget {
  bool empty;
  AdverbCategoryModel item;
  CategoryCardWidget({super.key, required this.empty, required this.item});

  @override
  Widget build(BuildContext context) {
    return empty == false
        ? ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            initiallyExpanded: false,
            title: Text(
              item.name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            children: List.generate(
                item.pods.length,
                (index) => CategoryCardWidget(
                    empty: item.pods[index].pods.isEmpty,
                    item: item.pods[index])))
        : GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAdverbSetNameView(categoryName: item.name)));
      },
          child: ListTile(
              title: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
        );
  }
}
