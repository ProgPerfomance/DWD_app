import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/main/create_order_set_name.dart';

import '../../domain/get_categories_list.dart';
import '../widgets/top_row_widget.dart';

class CreateOrderSelectPodcategoryView extends StatelessWidget {
  final id;
  final name;
  const CreateOrderSelectPodcategoryView({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<GetCategoriesList>();
    watchModel.getPodCategoriesList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopRowWidget(text: 'Создание заявки'),
              SizedBox(height: 16,),
              Center(
                child: Container(
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
              ),
              SizedBox(height: 12,),
              SizedBox(
                height:  MediaQuery.of(context).size.height - 243,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(watchModel.podcategory.length, (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetName(name: name,)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10,),
                              Text(watchModel.podcategory[index]['name'], style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff333333),
                              ),),
                            ],
                          ),

                          const SizedBox(height: 12,),
                        ],
                      ),
                    )),
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
