import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/get_catigories.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/models/category_model.dart';
import 'package:untitled1/view/main/create_order/create_order_set_name.dart';


class CatigoriesListWidget extends StatelessWidget {
  const CatigoriesListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final watchModel = context.watch<GetCatigories>();
    print(watchModel);
    watchModel.getCat();
    return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.0.heightBox,
                      Container(
                        height: 41,
                        width: context.width - 40,
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
                                  child: Image.asset(
                                      'assets/design/images/search.png'),
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
                      12.heightBox,
                      SizedBox(
                      height: context.height - 183,
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(
     watchModel.categoryList.length,
    //print( watchModel.categoryList.length);
    //print(watchModel.categoryList.length),
    (index) => _subcategoryBuild(watchModel.categoryList[index],context),
      /*  GestureDetector(
    onTap: () { if(watchModel.categoryList[index].subcategories == true) {ExpansionTile(
      leading: Icon(Icons.menu),
      title: Text(
        watchModel.categoryList[index].name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
       children: watchModel.categoryList[index].subcategories!.map(_subcategoryBuild).toList(),
    );
      //_subcategoryBuild(watchModel.categoryList[index]);
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetName(
        name: watchModel.categoryList[index].name,
      )));
    }},
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              //(watchModel.categoryList as List)[index]['name'] ,
          watchModel.categoryList[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            watchModel.categoryList[index].subcategories!.isNotEmpty ?
             Image.asset(
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
    ) */
    ))))
    //if (watchModel.categoryList[index]['subcategories'] == true) {
    //Navigator.push(context, MaterialPageRoute(
    //builder: (context) =>
    //CreateOrderSelectPodcategoryView(
    //id: watchModel
    //    .categories[index]['id'],name: watchModel
    //    .categories[index]['name'],)));
    //}
    //else {
    //Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetName(
    //name: watchModel
     //   .categories[index]['name'],

    ]
    );
    }
   Widget _subcategoryBuild(Category_model list, BuildContext context)

    {

      if (list.subcategories!.isEmpty) {
      //  return Builder(
        //    builder: (context) {
              return ListTile(
                  onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderSetName(name: list.name,))),
                  leading: SizedBox(),
                  title: Text(
                      list.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
              );
          //  }
        //);
      }
      return ExpansionTile(
        //leading: Icon(list.icon),
        initiallyExpanded: false,
        title: Text(
          list.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

        ),
        children: list.subcategories!.map((subcat)=>_subcategoryBuild(subcat, context)).toList(),
      );
    }
    }


