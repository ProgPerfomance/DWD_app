import 'package:flutter/material.dart';

class CitysListView extends StatelessWidget {
  const CitysListView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Поиск города',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset('assets/design/images/cross.png'),
                ],
              ),
              const SizedBox(height: 16,),
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
                      hintText: 'Город',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff808080),
                      )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              const Text('Популярные города', style:
                TextStyle(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w500,
                ),),

            ],
          ),
        ),
      ),
    );
  }
}
