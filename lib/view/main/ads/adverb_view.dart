import 'package:flutter/material.dart';
import 'package:untitled1/model/ads_model.dart';

class AdverbView extends StatelessWidget {
  final AdverbModel adverbModel;
  const AdverbView({super.key, required this.adverbModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Объявление номер ${adverbModel.id}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 260,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                children: [
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.grey.shade700,
                        size: 70,
                      ),
                    ),
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.grey.shade700,
                        size: 70,
                      ),
                    ),
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.grey.shade700,
                        size: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Продажа',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff6FC727),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            '10',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Color(0xffCBCBCB)),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Image.asset('assets/design/images/eye.png'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    adverbModel.age.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${adverbModel.price} €',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Color(0xff333333),
                    ),
                  ),
                  (adverbModel.phone == '1' && adverbModel.messages == '1') ?  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width /2 - 24,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff3333333),
                        ),
                        child: const Center(child: Text('Позвонить', style: TextStyle(
                          color: Colors.white
                        ),)),
                      ),
                      const SizedBox(width: 7.8,),
                      Container(
                        width: MediaQuery.of(context).size.width /2 - 24,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffF14F44),
                        ),
                        child: const Center(child: Text('Написать', style: TextStyle(
                            color: Colors.white
                        ),)),
                      )
                    ],
                  ) :   (adverbModel.messages == '1') ?   Container(
                    width: MediaQuery.of(context).size.width  - 48,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(child: Text('Написать', style: TextStyle(
                        color: Colors.white
                    ),)),
                  ) : (adverbModel.phone == '1') ?   Container(
                    width: MediaQuery.of(context).size.width  - 48,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(child: Text('Позвонить', style: TextStyle(
                        color: Colors.white
                    ),)),
                  ) : const SizedBox(),
                  SizedBox(height: 20,),
                  const Text('Описание',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff808080)
                  ),),
                  Text(adverbModel.description.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
