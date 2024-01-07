// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/ads/get_ads_list.dart';
import 'package:untitled1/model/user_model.dart';
import 'package:untitled1/view/main/ads/adverb_view.dart';
import '../../../domain/user/get_user_profile.dart';
import 'create_adverb/create_adverb_select_category_view.dart';

class AvitoListView extends StatelessWidget {
  const AvitoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = context.read<GetUserProfile>();
    final getAdverbsModel = context.read<GetAdsList>();
    getAdverbsModel.getAdsList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Все заявки'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CreateAdverbSelectCategoryView()));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 122,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: (100 / 153),
                  children:
                      List.generate(getAdverbsModel.adverbs.length, (index) {
                    var item = getAdverbsModel.adverbs[index];
                    return GestureDetector(
                      onTap: () async {
                        UserModel newUserModel = await userModel
                            .getOtherUserProfile(int.parse(item.uid));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdverbView(
                                      adverbModel:
                                          getAdverbsModel.adverbs[index],
                                      userModel: newUserModel,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  'assets/pc.png',
                                  fit: BoxFit.contain,
                                )),
                            const SizedBox(
                              height: 4,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Colors.red,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xffECEDF1),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xffECEDF1),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xffECEDF1),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Color(0xffECEDF1),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.age.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item.price.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Игорь',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff808080),
                                        ),
                                      ),
                                      Image.asset(
                                          'assets/design/images/fi_star.png'),
                                      const Text(
                                        '4.2',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: Color(0xffF9CF3A),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Text(
                                        '(5)',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff808080),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.address.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 8,
                                        color: Color(0xff808080)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
