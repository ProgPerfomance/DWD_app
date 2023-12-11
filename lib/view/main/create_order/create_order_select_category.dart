import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/get_categories_list.dart';
import 'package:untitled1/view/main/create_order/create_order_set_name.dart';

import 'create_order_select_podcategory.dart';

class CreateOrderSelectCategory extends StatelessWidget {
  const CreateOrderSelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<GetCategoriesList>();
    watchModel.getCategoriesList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 41,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffEBEBEB),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0, top: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Image.asset('assets/design/images/search.png'),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: 'Чем вам помочь',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff808080),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 183,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        watchModel.categories.length,
                        (index) => GestureDetector(
                              onTap: () {
                                if (watchModel
                                    .categories[index]['podspheres'] == true) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          CreateOrderSelectPodcategoryView(
                                              id: watchModel
                                                  .categories[index]['id'],name: watchModel
                                              .categories[index]['name'],)));
                                }
                                else {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetName(
                                    name: watchModel
                                        .categories[index]['name'],
                                  )));
                                }
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        watchModel.categories[index]['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      watchModel.categories[index]
                                                  ['podspheres'] ==
                                              true
                                          ? Image.asset(
                                              'assets/design/images/arrowright.png')
                                          : const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    color: const Color(0xffEBEBEB),
                                    height: 1,
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
