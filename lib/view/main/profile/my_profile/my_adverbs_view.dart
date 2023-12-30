import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/ads/get_my_adverbs.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';

import '../../../../domain/user/get_user_profile.dart';
import '../../../../model/user_model.dart';
import '../../ads/adverb_view.dart';

class MyAdverbsView extends StatelessWidget {
  const MyAdverbsView({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = context.read<GetUserProfile>();
    final myUserModel = context.read<CreateUser>();
    final getAdverbsModel = context.read<GetMyAdverbs>();
    getAdverbsModel.getMyAdverbs(int.parse(myUserModel.uid));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои объявления'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 122,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: (100 / 153),
              children:
              List.generate(getAdverbsModel.myAdberbs.length, (index) {
                var item = getAdverbsModel.myAdberbs[index];
                return GestureDetector(
                  onTap: () async {
                    UserModel newUserModel = await userModel
                        .getOtherUserProfile(int.parse(item.uid));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdverbView(
                              adverbModel:
                              getAdverbsModel.myAdberbs[index],
                              userModel: newUserModel,
                            )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
      ),
    );
  }
}
