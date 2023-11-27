import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/get_categories_list.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/set_freelancer_category_2_view.dart';

class SetFreelancerCategory1View extends StatelessWidget {
  const SetFreelancerCategory1View({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/design/images/arrowleft.png'),
                  const Text(
                    'Шаг 2 из 4',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset('assets/design/images/cross.png'),
                ],
              ),
              const SizedBox(height: 16,),
              const Text('Чем хотите заниматься?' , style: TextStyle(
                fontSize: 22,
              ),),
              const SizedBox(height: 8,),
              const Text('Выберите категории заданий, в которых хотите работать.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff808080),
                ),),
              const SizedBox(height: 12,),
              SizedBox(
                height:  MediaQuery.of(context).size.height - 183,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(watchModel.categories.length, (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SetFreelancerCategory2View(id: watchModel.categories[index]['id'])));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(watchModel.categories[index]['name'], style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),),
                          const SizedBox(height: 12,),
                          Container(
                            color: const Color(0xffEBEBEB),
                            height: 1,
                            width: MediaQuery.of(context).size.width - 40,
                          ),
                          const SizedBox(height: 12,),
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
