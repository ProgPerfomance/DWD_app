import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/get_categories_list.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/set_freelancer_send_on_you_view.dart';

class SetFreelancerCategory2View extends StatelessWidget {
  final id;
  const SetFreelancerCategory2View({super.key, required this.id});

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
                height:  MediaQuery.of(context).size.height - 243,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(watchModel.podcategory.length, (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SetFreelancerCategory2View(id: watchModel.categories[index]['id'])));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: const Color(0xff808080)),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(watchModel.podcategory[index]['name'], style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),),
                            ],
                          ),
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SetFreelancerSendOnYouView()));
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width - 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF14F44),
                  ),
                  child: const Center(
                    child: Text('Продолжить', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
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
